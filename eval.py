"""
Python script that evaluates GMTKN55.

This module reads and evaluates GMTKN55 ``.res``/``.resRC`` reaction
definitions directly in Python, reproducing the energy-reading semantics of
the external ``tmer2++`` program without invoking it. The evaluation
pipeline is:

    .res line -> ReactionDefinition -> EnergyReader -> ReactionResult -> DataFrame -> stats()

See ``FORMATS.md`` for a human-readable reference of the supported
``--format`` IDs.
"""

from __future__ import annotations

import argparse
import functools
import re
import shlex
import subprocess as sp
from dataclasses import dataclass
from pathlib import Path
from typing import Callable

import pandas as pd
from tqdm import tqdm

from utils import (
    filter_res_file,
    Molecule,
    get_molecules_from_filesystem,
    parse_element_list,
    check_molecule_composition,
    MoleculeConstraints,
    stats,
)

# --------------------------------------------------------------------------
# Constants
# --------------------------------------------------------------------------

#: Hartree -> kcal/mol, as used by the reference tmer2++-compatible pipeline.
HARTREE_TO_KCAL = 627.509541
#: eV -> Hartree, used for VASP OUTCAR energies (format 31).
EV_TO_HARTREE = 27.21138505
#: Empirical scaling factor applied to ORCA "SC+NL" energies (format 36).
SCNL_SCALE = 0.73
#: Hartree -> kcal/mol constant used specifically for DFT-D3 ABC terms and a
#: handful of crystal/VASP formats, matching tmer2++'s literal constant there.
DFTD3_HARTREE_TO_KCAL = 627.50947428
#: kJ/mol -> Hartree, used for SNF thermostatistical corrections.
SNF_KJMOL_TO_HARTREE = 2625.4999
#: A computed reaction energy differing from its reference by more than this
#: many kcal/mol is treated as implausible (e.g. non-converged energies),
#: mirroring the legacy sanity check applied to tmer2++ output lines.
IMPLAUSIBLE_ENERGY_THRESHOLD_KCAL = 750.0

FLOAT_RE = re.compile(r"[-+]?(?:\d+(?:\.\d*)?|\.\d+)(?:[EeDd][-+]?\d+)?")


# --------------------------------------------------------------------------
# Exceptions
# --------------------------------------------------------------------------


class EvaluationError(Exception):
    """Base class for errors raised while evaluating GMTKN55 reactions."""


class UnsupportedFormatError(EvaluationError):
    """Raised when a requested ``--format`` ID has no registered energy reader."""


class EnergyParseError(EvaluationError):
    """Raised when an energy output file exists but cannot be parsed."""


class MissingEnergyError(EvaluationError):
    """Raised when a molecule's energy could not be found (e.g. missing file)."""


class ImplausibleResultError(EvaluationError):
    """Raised when a computed reaction energy is implausibly far from its reference."""


# --------------------------------------------------------------------------
# Data model
# --------------------------------------------------------------------------


@dataclass(frozen=True)
class ReactionDefinition:
    """A single reaction parsed from a ``.res`` file, before energy evaluation."""

    molecules: tuple[str, ...]
    stoichiometry: tuple[float, ...]
    reference_value: float
    format_id: int
    energy_add: float = 0.0
    error_multiplier: float = 1.0


@dataclass(frozen=True)
class ReactionResult:
    """The outcome of evaluating a ``ReactionDefinition``."""

    definition: ReactionDefinition
    calculated_value: float
    error: float


# --------------------------------------------------------------------------
# Low-level text / numeric parsing helpers
# --------------------------------------------------------------------------


def extract_floats(line: str) -> list[float]:
    """Extract Fortran-style floating point values from a line."""
    return [
        float(value.replace("D", "E").replace("d", "e"))
        for value in FLOAT_RE.findall(line)
    ]


def expand_braces(token: str) -> list[str]:
    """
    Expand the simple shell brace expressions used by GMTKN55 .res files,
    e.g. ``B_{T,G}`` -> ``["B_T", "B_G"]`` or ``1{,A,B}`` -> ``["1", "1A", "1B"]``.
    """
    start = token.find("{")
    if start < 0:
        return [token]
    end = token.find("}", start)
    if end < 0:
        return [token]
    prefix = token[:start]
    suffix = token[end + 1 :]
    expanded: list[str] = []
    for option in token[start + 1 : end].split(","):
        for tail in expand_braces(suffix):
            expanded.append(prefix + option + tail)
    return expanded


def substitute_res_variables(token: str, method: str, res_format: int) -> str:
    """Replace the positional/shell variables (``$f``, ``$w``, ``$1``, ``$2``, ...) used by .res files."""
    return (
        token.replace("${f}", method)
        .replace("${w}", str(res_format))
        .replace("$1", method)
        .replace("$2", str(res_format))
        .replace("$f", method)
        .replace("$w", str(res_format))
    )


def normalize_tmer_tokens(line: str, method: str, res_format: int) -> list[str]:
    """Tokenize a tmer command line and apply the shell expansions it relies on."""
    tokens = shlex.split(line, comments=True, posix=True)
    normalized: list[str] = []
    for token in tokens:
        token = substitute_res_variables(token, method, res_format)
        normalized.extend(expand_braces(token))
    return normalized


# --------------------------------------------------------------------------
# File / numeric-field reading helpers
# --------------------------------------------------------------------------


def read_file_lines(path: Path) -> list[str]:
    """
    Read a text file's lines. A missing file yields no lines, so that
    energy readers naturally fall back to their 0.0 default (matching
    tmer2++'s Fortran behavior of leaving a real*8 variable at 0.0d0).
    """
    if not path.exists():
        return []
    return path.read_text(encoding="utf8", errors="replace").splitlines()


def value_at(values: list[float], index: int, default: float = 0.0) -> float:
    """Return a 1-based Fortran-style numeric field, or ``default`` if out of range."""
    if 1 <= index <= len(values):
        return values[index - 1]
    return default


def last_scalar(path: Path, field: int = 1) -> float:
    """Return the requested numeric field from the last readable numeric line."""
    value = 0.0
    for line in read_file_lines(path):
        values = extract_floats(line)
        if len(values) >= field:
            value = values[field - 1]
    return value


def first_scalar(path: Path, field: int = 1) -> float:
    """Return the requested numeric field from the first readable numeric line."""
    for line in read_file_lines(path):
        values = extract_floats(line)
        if len(values) >= field:
            return values[field - 1]
    return 0.0


def first_two_scalars(path: Path) -> tuple[float, float]:
    """Read the first scalar of each of the first two numeric lines."""
    values: list[float] = []
    for line in read_file_lines(path):
        fields = extract_floats(line)
        if fields:
            values.append(fields[0])
        if len(values) == 2:
            break
    while len(values) < 2:
        values.append(0.0)
    return values[0], values[1]


def matching_value(
    path: Path,
    pattern: str,
    field: int = -1,
    stop_at_first: bool = False,
    scale: float = 1.0,
) -> float:
    """Scan a file for a substring and return the selected numeric field of matching lines."""
    value = 0.0
    for line in read_file_lines(path):
        if pattern in line:
            values = extract_floats(line)
            if values:
                selected = values[field] if field < 0 else value_at(values, field)
                value = selected * scale
                if stop_at_first:
                    break
    return value


def read_scalar_file(path: Path, name: str) -> float:
    """Read the first numeric field of the last numeric line of ``path / name``."""
    return last_scalar(path / name, 1)


# --------------------------------------------------------------------------
# Format-specific energy readers
# --------------------------------------------------------------------------


def read_turbomole_energy(path: Path, field: int = 2) -> float:
    """
    Read the requested column from the last data row of a Turbomole
    ``$energy`` file, e.g.::

        $energy      SCF               SCFKIN            SCFPOT
             1   -76.32391095283    76.36589205744  -152.68980301027
            13   -76.36193346192    76.27026622625  -152.63219968817
        $end

    ``field=2`` (the default) returns the SCF column of the final row
    (``-76.36193346192`` above). Only rows between ``$energy`` and the next
    ``$``-prefixed line are considered, so unrelated numeric data appearing
    later in the same file (e.g. a ``$grad`` block) cannot be mistaken for
    additional energy rows.
    """
    value = 0.0
    in_energy_block = False
    for line in read_file_lines(path / "energy"):
        stripped = line.strip()
        if stripped.startswith("$energy"):
            in_energy_block = True
            continue
        if stripped.startswith("$"):
            in_energy_block = False
            continue
        if not in_energy_block:
            continue
        values = extract_floats(stripped)
        if len(values) >= field:
            value = values[field - 1]
    return value


def read_b2plyp_energy(path: Path) -> float:
    """B2PLYP-style double-hybrid energy (SCF + correlation) from ``plyp.out``."""
    escf = 0.0
    ec = 0.0
    for line in read_file_lines(path / "plyp.out"):
        values = extract_floats(line)
        if not values:
            continue
        if (
            "*  Final MP2 energy" in line
            or "*  correlation energy" in line
            or "*  MP2 correlation energy" in line
        ):
            ec = values[-1]
            break
        if (
            "*  UHF -energy  " in line
            or "*  RHF -energy  " in line
            or "*  RHF  energy" in line
            or "|  total energy      =" in line
        ):
            escf = values[-1]
    return escf + ec


def read_scs_mp2_energy(path: Path) -> float:
    """SCS-MP2 energy from ``mp2.out``."""
    lines = read_file_lines(path / "mp2.out")
    for i, line in enumerate(lines):
        values = extract_floats(line)
        if not values:
            continue
        if (
            "*  SCS total           :" in line
            or "| E[SCS-MP2]   =" in line
            or "EMP2            :" in line
        ):
            return 0.0
        if "*  RHF -energy                           " in line:
            energy = values[-1]
            if i + 7 < len(lines):
                next_values = extract_floats(lines[i + 7])
                if next_values:
                    energy += next_values[-1] * 1.20
            if i + 8 < len(lines):
                next_values = extract_floats(lines[i + 8])
                if next_values:
                    energy += next_values[-1] / 3.0
            return energy
    return 0.0


def read_mp2_energy(path: Path) -> float:
    """MP2 energy from ``mp2.out``."""
    lines = read_file_lines(path / "mp2.out")
    for i, line in enumerate(lines):
        values = extract_floats(line)
        if not values:
            continue
        if "| EMP2         =" in line or "*  Final MP2 energy" in line:
            return values[-1]
        if "*  RHF -energy                           " in line:
            energy = values[-1]
            if i + 7 < len(lines):
                next_values = extract_floats(lines[i + 7])
                if next_values:
                    energy += next_values[-1]
            if i + 8 < len(lines):
                next_values = extract_floats(lines[i + 8])
                if next_values:
                    energy += next_values[-1]
            return energy
    return 0.0


def read_mp3_energy(path: Path) -> float:
    """MP3 correlation energy from ``mp3.out``."""
    return matching_value(path / "mp3.out", "Ec[(3)]      =", -1)


def read_gaussian_energy(path: Path) -> float:
    """SCF energy from a Gaussian ``g.out`` file."""
    value = 0.0
    for line in read_file_lines(path / "g.out"):
        if "SCF Done: " in line:
            values = extract_floats(line)
            if len(values) >= 3:
                value = values[-3]
                break
    return value


def read_qcisd_t_energy(path: Path) -> float:
    """QCISD(T) energy from ``qci.out`` (falls back to SCS-MP2 if not found)."""
    value = 0.0
    for line in read_file_lines(path / "qci.out"):
        values = extract_floats(line)
        if not values:
            continue
        if "| E[SCS-MP2]" in line:
            value = values[-1]
        if "| E[QCISD(T)]  =" in line:
            value = values[-1]
            break
    return value


def read_qcisd_t_minus_mp2_energy(path: Path) -> float:
    """QCISD(T) minus MP2 correction from ``qci.out``."""
    qci = 0.0
    mp2 = 0.0
    for line in read_file_lines(path / "qci.out"):
        values = extract_floats(line)
        if not values:
            continue
        if "| E[QCISD(T)]  =" in line:
            qci = values[-1]
            break
        if "| E[MP2]       =" in line:
            mp2 = values[-1]
    return qci - mp2


def read_molpro_energy(path: Path, mode: int) -> float:
    """
    Read an energy from Molpro ``ccsdt.out``.

    ``mode=1``: SCS-MP2 total energy.
    ``mode=2``: CCSD(T) total energy.
    ``mode=3``: CCSD(T) minus MP2 (a delta-correlation correction).
    """
    energy = 0.0
    for line in read_file_lines(path / "ccsdt.out"):
        values = extract_floats(line)
        if not values:
            continue
        if mode == 1 and "SCS-MP2 total energy:" in line:
            energy = values[-1]
        elif mode == 2 and "CCSD(T) STATE" in line:
            energy = values[-1]
        elif mode == 3 and " MP2 total energy:" in line:
            energy = -values[-1]
        elif mode == 3 and "CCSD(T) STATE" in line:
            energy += values[-1]
            break
    return energy


def read_corval_delta(path: Path) -> float:
    """Core-valence correlation + core polarization correction from ``.CORVAL``."""
    first, second = first_two_scalars(path / ".CORVAL")
    return first - second


def read_cbs_corval_ccsdt_energy(path: Path) -> float:
    """CBS extrapolation + delta-CCSD(T) + core-valence correction (format 11)."""
    return (
        read_corval_delta(path)
        + read_scalar_file(path, ".CBS")
        + read_molpro_energy(path, mode=3)
    )


def read_cbs_ccsdt_energy(path: Path) -> float:
    """CBS extrapolation + delta-CCSD(T) correction (format 12)."""
    return read_scalar_file(path, ".CBS") + read_molpro_energy(path, mode=3)


def read_orca_energy(path: Path) -> float:
    """ORCA ``FINAL SINGLE POINT ENERGY`` from ``orca.out``."""
    return matching_value(path / "orca.out", "FINAL SINGLE", -1)


def read_turbomole_mvd_energy(path: Path) -> float:
    """Mass-velocity-Darwin (scalar relativistic) correction from ``scf.out`` (format 15)."""
    return matching_value(path / "scf.out", "4 + darwin", -1, stop_at_first=True)


def read_cbs_energy(path: Path) -> float:
    """CBS-extrapolated energy stored in ``.CBS``."""
    return read_scalar_file(path, ".CBS")


def read_mp2_5_energy(path: Path) -> float:
    """MP2.5/CBS composite energy: CBS energy + half the MP3 correlation correction."""
    cbs = read_scalar_file(path, ".CBS")
    mp3 = read_mp3_energy(path)
    if mp3 == 0.0:
        mp3 = read_scalar_file(path, ".E3")
    return cbs + 0.5 * mp3


def read_evdw_energy(path: Path) -> float:
    """
    van der Waals dispersion energy via the external ``evdw`` program.

    This is the one remaining external-process dependency in this module:
    ``evdw`` is a small standalone utility (unrelated to ``tmer2++``) that
    has no pure-Python equivalent here, so format 18 still shells out to it.
    A missing binary or missing ``coord`` file yields 0.0 (treated as a
    missing energy), consistent with every other reader in this module.
    """
    coord = path / "coord"
    if not coord.exists():
        return 0.0
    try:
        result = sp.run(
            ["evdw", str(coord)],
            check=False,
            capture_output=True,
            text=True,
        )
    except OSError:
        return 0.0
    for line in result.stdout.splitlines():
        values = extract_floats(line)
        if values:
            return values[-1] / HARTREE_TO_KCAL
    return 0.0


def read_nwchem_energy(path: Path) -> float:
    """Total DFT energy from an NWChem ``nw.out`` file."""
    return matching_value(path / "nw.out", "Total DFT energy =", -1, stop_at_first=True)


def read_eat_energy(path: Path) -> float:
    """Atomization energy correction from ``.EAT`` (kcal/mol, sign-flipped, converted to Hartree)."""
    return -read_scalar_file(path, ".EAT") / HARTREE_TO_KCAL


def read_h298_energy(path: Path) -> float:
    """Enthalpy of formation at 298 K from ``.H298`` (kcal/mol, converted to Hartree)."""
    return read_scalar_file(path, ".H298") / HARTREE_TO_KCAL


def read_g298_energy(path: Path) -> float:
    """Free energy of formation at 298 K from ``.G298`` (kcal/mol, converted to Hartree)."""
    return read_scalar_file(path, ".G298") / HARTREE_TO_KCAL


def read_ehtenergy(path: Path) -> float:
    """Extended-Hueckel energy from ``ehtenergy``."""
    return first_scalar(path / "ehtenergy", 2)


def read_dftbplus_energy(path: Path) -> float:
    """Total energy from a DFTB+ ``detailed.out`` file."""
    return matching_value(path / "detailed.out", "Total energy:   ", 1)


def read_turbomole_scf_energy(path: Path, remove_edisp: bool = False) -> float:
    """SCF total energy from a Turbomole ``scf.out`` file, optionally removing the D3 dispersion term."""
    escf = 0.0
    edisp = 0.0
    for line in read_file_lines(path / "scf.out"):
        values = extract_floats(line)
        if not values:
            continue
        if "empirical dispersive" in line:
            edisp = values[-1]
        if "|  total energy      =" in line:
            escf = values[-1]
            break
    return escf - edisp if remove_edisp else escf


def read_snf_energy(path: Path, mode: int) -> float:
    """Thermostatistical correction from SNF's ``snf.out`` (mode 1: enthalpy, mode 2: Gibbs energy)."""
    if mode == 1:
        pattern = "Enthalpy H [kJ/mol]"
    else:
        pattern = "Gibbs Enthalpy G"
    return matching_value(path / "snf.out", pattern, -1, stop_at_first=True) / SNF_KJMOL_TO_HARTREE


def read_vasp_energy(path: Path) -> float:
    """VASP total energy ("energy without entropy") from ``OUTCAR`` (eV, converted to Hartree)."""
    return matching_value(path / "OUTCAR", "energy  without", -1) / EV_TO_HARTREE


def read_edisp_energy(path: Path) -> float:
    """Dispersion correction stored in ``.EDISP``."""
    return read_scalar_file(path, ".EDISP")


def read_crystal_energy(path: Path) -> float:
    """CRYSTAL total energy from ``crystal.out``."""
    return matching_value(path / "crystal.out", "TOTAL ENERGY(", 2)


def read_crystal_energy_with_edisp(path: Path) -> float:
    """CRYSTAL total energy plus a dispersion correction from ``.EDISP``."""
    return read_crystal_energy(path) + read_edisp_energy(path)


def read_orca_scnl_energy(path: Path) -> float:
    """ORCA "SC+NL" (semiclassical non-local correlation) energy from ``orca.out``."""
    return matching_value(path / "orca.out", "SC+NL", -1)


def read_orca_scnl_scaled_energy(path: Path) -> float:
    """Scaled ORCA "SC+NL" energy (see ``SCNL_SCALE``)."""
    return SCNL_SCALE * read_orca_scnl_energy(path)


def read_turbomole_cpc_edisp_energy(path: Path) -> float:
    """Turbomole SCF energy plus counterpoise and dispersion corrections."""
    return (
        read_turbomole_energy(path, field=2)
        + read_scalar_file(path, ".CPC")
        + read_edisp_energy(path)
    )


def read_turbomole_half_cpc_edisp_energy(path: Path) -> float:
    """Dispersion correction plus half the Turbomole SCF energy plus counterpoise correction."""
    return (
        read_edisp_energy(path)
        + 0.5 * read_turbomole_energy(path, field=2)
        + read_scalar_file(path, ".CPC")
    )


def read_hfc_energy(path: Path) -> float:
    """Total energy (in a.u.) from an ``hfc.out`` file."""
    return matching_value(path / "hfc.out", "Etot  /kcal,au:", -1, stop_at_first=True)


def read_crystal_postscf_energy(path: Path) -> float:
    """CRYSTAL post-SCF (e.g. MP2) total energy from ``crystal.out``."""
    return matching_value(path / "crystal.out", "TOTAL POST-SCF ENERGY(AU)", 1)


def read_ancopt_energy(path: Path) -> float:
    """Optimized energy from an ``ancopt.out`` file."""
    return matching_value(path / "ancopt.out", "Energy =", 1)


def read_ancopt_energy_with_abc(path: Path) -> float:
    """``ancopt.out`` energy plus a 3-body (ABC) dispersion term from ``dftd3.out``."""
    return read_ancopt_energy(path) + (
        matching_value(path / "dftd3.out", "E6(ABC)", 2, stop_at_first=True)
        / DFTD3_HARTREE_TO_KCAL
    )


def read_turbomole_cpc_energy(path: Path) -> float:
    """Turbomole SCF energy plus a counterpoise correction from ``.CPC``."""
    return read_turbomole_energy(path, field=2) + read_scalar_file(path, ".CPC")


def read_msindo_energy(path: Path) -> float:
    """Semiempirical MSINDO energy from ``.msindo``."""
    return read_scalar_file(path, ".msindo")


def read_driver_energy(path: Path) -> float:
    """Energy from a generic ``.DRIVER`` scalar output file."""
    return first_scalar(path / ".DRIVER", 1)


def read_crystal_thermal_correction(path: Path, pattern: str, field: int) -> float:
    """
    Read a CRYSTAL thermostatistical correction (ZPE or thermal energy) from
    ``freq/crystal.out``, normalized by the supercell expansion factor found
    in the "EXPANSION MATRIX OF PRIMITIVE CELL" block.
    """
    super_matrix = [[1.0 if i == j else 0.0 for j in range(3)] for i in range(3)]
    value = 0.0
    lines = read_file_lines(path / "freq" / "crystal.out")
    i = 0
    while i < len(lines):
        line = lines[i]
        if pattern in line:
            values = extract_floats(line)
            value = value_at(values, field)
        if "EXPANSION MATRIX OF PRIMITIVE CELL" in line:
            for row in range(3):
                if i + row + 1 < len(lines):
                    values = extract_floats(lines[i + row + 1])
                    for col in range(3):
                        super_matrix[row][col] = value_at(values, col + 2)
            i += 3
        i += 1
    scale = 1.0
    for row in super_matrix:
        scale *= sum(row)
    return value / scale if scale else value


def read_crystal14_energy(path: Path) -> float:
    """CRYSTAL14-style total energy from ``crystal.out``, preferring a converged optimization energy."""
    energy = 0.0
    for line in read_file_lines(path / "crystal.out"):
        values = extract_floats(line)
        if not values:
            continue
        if "TOTAL ENERGY" in line:
            energy = value_at(values, 2) if abs(value_at(values, 2)) > 0.0 else value_at(values, 1)
        if "OPT END - CONVERGED" in line and abs(value_at(values, 1)) > 0.0:
            energy = value_at(values, 1)
    return energy


def read_crystal_primitive_cell_energy(path: Path) -> float:
    """CRYSTAL primitive-cell energy from ``crystal.out``."""
    return matching_value(path / "crystal.out", "PRIMITIVE CELL - CENTRING", 2) / DFTD3_HARTREE_TO_KCAL


def read_vasp_volume_energy(path: Path) -> float:
    """VASP cell-volume-derived quantity from ``OUTCAR``."""
    return matching_value(path / "OUTCAR", "volume of cell", 1) / DFTD3_HARTREE_TO_KCAL


def read_adf_energy(path: Path) -> float:
    """Total energy (Hartree) from an ADF ``adf.out`` file."""
    return matching_value(path / "adf.out", "Energy (hartree)", 1)


def read_dftc_energy(path: Path) -> float:
    """Scalar energy correction stored in ``.DFTC``."""
    return read_scalar_file(path, ".DFTC")


def read_dirac_energy(path: Path) -> float:
    """Total energy from a DIRAC ``dirac_struc.out`` file."""
    return matching_value(path / "dirac_struc.out", "Total energy                             :", 1)


def read_molpro_ks_energy(path: Path) -> float:
    """Kohn-Sham total energy from a Molpro ``molpro.out`` file."""
    return matching_value(path / "molpro.out", "DF-KS/", 1)


# --------------------------------------------------------------------------
# Energy reader registry and dispatch
# --------------------------------------------------------------------------

EnergyReader = Callable[[Path], float]

#: Maps the base ``--format`` ID (after stripping the +100/+200/... modifiers,
#: see ``split_method_modifiers``) to the function that reads a molecule's
#: energy for that format. See FORMATS.md for a description of every ID.
ENERGY_READERS: dict[int, EnergyReader] = {
    0: read_turbomole_energy,
    1: read_b2plyp_energy,
    2: read_scs_mp2_energy,
    3: read_mp3_energy,
    4: read_qcisd_t_energy,
    5: read_mp2_energy,
    6: read_b2plyp_energy,
    7: read_gaussian_energy,
    8: functools.partial(read_molpro_energy, mode=3),
    9: read_b2plyp_energy,
    10: read_corval_delta,
    11: read_cbs_corval_ccsdt_energy,
    12: read_cbs_ccsdt_energy,
    13: read_orca_energy,
    14: functools.partial(read_molpro_energy, mode=2),
    15: read_turbomole_mvd_energy,
    16: read_cbs_energy,
    17: read_mp2_5_energy,
    18: read_evdw_energy,
    19: read_nwchem_energy,
    20: read_eat_energy,
    21: read_h298_energy,
    22: read_ehtenergy,
    23: read_dftbplus_energy,
    24: read_turbomole_scf_energy,
    25: functools.partial(read_turbomole_scf_energy, remove_edisp=True),
    26: read_qcisd_t_minus_mp2_energy,
    27: read_g298_energy,
    28: functools.partial(read_snf_energy, mode=1),
    29: functools.partial(read_snf_energy, mode=2),
    30: functools.partial(read_scalar_file, name=".CPC"),
    31: read_vasp_energy,
    32: read_edisp_energy,
    33: read_crystal_energy,
    34: read_crystal_energy_with_edisp,
    35: read_orca_scnl_energy,
    36: read_orca_scnl_scaled_energy,
    37: read_turbomole_cpc_edisp_energy,
    38: read_turbomole_half_cpc_edisp_energy,
    39: read_hfc_energy,
    40: read_crystal_postscf_energy,
    41: read_ancopt_energy,
    42: read_ancopt_energy_with_abc,
    43: read_turbomole_cpc_energy,
    44: functools.partial(read_turbomole_energy, field=3),
    45: functools.partial(read_turbomole_energy, field=4),
    46: functools.partial(read_scalar_file, name=".msindo"),
    47: read_driver_energy,
    48: read_crystal14_energy,
    50: read_crystal_primitive_cell_energy,
    51: read_vasp_volume_energy,
    52: read_adf_energy,
    53: functools.partial(read_scalar_file, name=".DFTC"),
    54: read_dirac_energy,
    55: read_molpro_ks_energy,
}


def split_method_modifiers(format_id: int) -> tuple[int, bool, bool, bool, bool, bool]:
    """
    Split a tmer2++-style ``--format`` ID into its base ID plus correction
    modifiers (dispersion, counterpoise, 3-body ABC, ZPE, thermal energy).

    The modifiers stack as offsets: +100 (vdW), +200 (CP), +300 (vdW+CP),
    +400 (ABC), +1000 (ZPE), +2000 (ZPE+thermal).
    """
    vdw = False
    cp = False
    abc = False
    zpe = False
    etherm = False
    if format_id >= 2000:
        format_id -= 2000
        zpe = True
        etherm = True
    if format_id >= 1000:
        format_id -= 1000
        zpe = True
    if format_id >= 400:
        format_id -= 400
        abc = True
    elif format_id >= 300:
        format_id -= 300
        vdw = True
        cp = True
    elif format_id >= 200:
        format_id -= 200
        cp = True
    elif format_id >= 100:
        format_id -= 100
        vdw = True
    return format_id, vdw, cp, abc, zpe, etherm


def read_energy(molecule_path: Path, format_id: int) -> float:
    """
    Read one molecule's energy for the given ``--format`` ID, applying any
    correction modifiers (dispersion, counterpoise, ABC, ZPE, thermal).

    :raises UnsupportedFormatError: if the base format ID has no registered reader.
    """
    base_id, vdw, cp, abc, zpe, etherm = split_method_modifiers(format_id)
    reader = ENERGY_READERS.get(base_id)
    if reader is None:
        raise UnsupportedFormatError(
            f"No energy reader implemented for format id {base_id} "
            f"(requested format {format_id})."
        )
    energy = reader(molecule_path)
    if abc:
        energy += (
            matching_value(molecule_path / "dftd3.out", "E6(ABC)", 2, stop_at_first=True)
            / DFTD3_HARTREE_TO_KCAL
        )
    if vdw:
        energy += read_edisp_energy(molecule_path)
    if cp:
        energy += read_scalar_file(molecule_path, ".CPC")
    if zpe:
        energy += read_crystal_thermal_correction(molecule_path, "E0            :", 2)
    if etherm:
        energy += read_crystal_thermal_correction(molecule_path, "ET            :", 1)
    return energy


# --------------------------------------------------------------------------
# .res parsing
# --------------------------------------------------------------------------

_TMER_COMMANDS = {"$tmer", "tmer", "tmer2++"}


def _looks_like_tmer_command(first_token: str) -> bool:
    """Fast pre-check on the raw (unexpanded) first token of a .res line."""
    return first_token in _TMER_COMMANDS or first_token.endswith("tmer2++")


def parse_tmer_line(
    line: str, method: str, res_format: int
) -> ReactionDefinition | None:
    """
    Parse one ``$tmer``/``tmer``/``tmer2++`` .res command into a
    ``ReactionDefinition``. Returns None if the line is not (or does not
    resolve to) a well-formed reaction command.
    """
    tokens = normalize_tmer_tokens(line, method, res_format)
    if not tokens or not _looks_like_tmer_command(tokens[0]) or "x" not in tokens:
        return None

    x_index = tokens.index("x")
    molecule_paths = tokens[1:x_index]
    tail = tokens[x_index + 1 :]
    if len(tail) < len(molecule_paths) + 2:
        return None

    factors: list[float] = []
    for token in tail:
        values = extract_floats(token)
        if values:
            factors.append(values[0])
    if len(factors) < len(molecule_paths) + 2:
        return None

    stoichiometry = factors[: len(molecule_paths)]
    parsed_format = int(factors[len(molecule_paths)])
    reference = 0.0
    energy_add = 0.0
    error_multiplier = 1.0
    # tmer2++ skips eref/eadd/emul for format 15 (MVD scalar-relativistic
    # correction): see tmer2.f, "imet.ne.15 ... makes no sense for MVD calc.".
    if parsed_format != 15:
        raw_reference = factors[len(molecule_paths) + 1]
        if abs(raw_reference) > 1.0e-8:
            reference = raw_reference
        if len(factors) > len(molecule_paths) + 2:
            raw_energy_add = factors[len(molecule_paths) + 2]
            if raw_energy_add > 1.0e-8:
                energy_add = raw_energy_add
        if len(factors) > len(molecule_paths) + 3:
            raw_error_multiplier = factors[len(molecule_paths) + 3]
            if raw_error_multiplier > 1.0e-8:
                error_multiplier = raw_error_multiplier

    return ReactionDefinition(
        molecules=tuple(molecule_paths),
        stoichiometry=tuple(stoichiometry),
        reference_value=reference,
        format_id=parsed_format,
        energy_add=energy_add,
        error_multiplier=error_multiplier,
    )


def parse_res_reactions(
    res_lines: list[str], method: str, res_format: int
) -> list[ReactionDefinition]:
    """
    Parse all reaction commands contained in (filtered) .res lines, in order,
    skipping blank lines, comments, and non-reaction shell boilerplate.
    """
    definitions: list[ReactionDefinition] = []
    for line in res_lines:
        stripped = line.strip()
        if not stripped or stripped.startswith("#"):
            continue
        raw_tokens = stripped.split()
        if not raw_tokens or not _looks_like_tmer_command(raw_tokens[0]):
            continue
        definition = parse_tmer_line(stripped, method, res_format)
        if definition is not None:
            definitions.append(definition)
    return definitions


# --------------------------------------------------------------------------
# Reaction evaluation
# --------------------------------------------------------------------------


def evaluate_reaction(definition: ReactionDefinition, subset_path: Path) -> ReactionResult:
    """
    Evaluate a single reaction: read each molecule's energy, form the
    stoichiometric sum, and compare against the reference value.

    :raises UnsupportedFormatError: if the reaction's format ID is unsupported.
    :raises MissingEnergyError: if any molecule's energy could not be found.
    :raises ImplausibleResultError: if the computed value is implausibly far
        from the reference value (likely a corrupted or non-converged output).
    """
    energies: list[float] = []
    for molecule in definition.molecules:
        energy = read_energy(subset_path / molecule, definition.format_id)
        if energy == 0.0:
            raise MissingEnergyError(
                f"No energy found for molecule '{molecule}' "
                f"(format {definition.format_id})."
            )
        energies.append(energy)

    calculated_value = (
        sum(energy * coeff for energy, coeff in zip(energies, definition.stoichiometry))
        * HARTREE_TO_KCAL
        + definition.energy_add
    )
    error = (calculated_value - definition.reference_value) * definition.error_multiplier

    if abs(calculated_value - definition.reference_value) > IMPLAUSIBLE_ENERGY_THRESHOLD_KCAL:
        raise ImplausibleResultError(
            f"Computed value {calculated_value:.3f} kcal/mol differs from reference "
            f"{definition.reference_value:.3f} kcal/mol by more than "
            f"{IMPLAUSIBLE_ENERGY_THRESHOLD_KCAL:.0f} kcal/mol for molecules "
            f"{definition.molecules}."
        )

    return ReactionResult(definition=definition, calculated_value=calculated_value, error=error)


# --------------------------------------------------------------------------
# CLI
# --------------------------------------------------------------------------


def get_args() -> argparse.Namespace:
    """Get the command line arguments."""
    parser = argparse.ArgumentParser(
        description="Detect fragments for a given list of molecules."
    )
    parser.add_argument(
        "--verbosity", "-v", type=int, default=1, help="Verbosity level."
    )
    parser.add_argument(
        "--allowed-elements",
        type=str,
        required=False,
        default=None,
        help="Allowed elements for the molecules. "
        + "If not provided, all elements are allowed. "
        + "If a molecule contains an element not in this list, it will be skipped. "
        + "Format example: `--allowed-elements '57-71, 81-*'",
    )
    parser.add_argument(
        "--required-elements-all",
        type=str,
        required=False,
        default=None,
        help="Required element(s) that MUST be in each molecule (ALL of them must be contained). "
        + "Format example: `--required-elements-all '57-71, 81-*'",
    )
    parser.add_argument(
        "--required-elements-one",
        type=str,
        required=False,
        default=None,
        help="Required element(s) that MUST be in each molecule "
        + "(at least one of them must be contained). "
        + "Format example: `--required-elements-one '57-71, 81-*'",
    )
    parser.add_argument(
        "--min-charge",
        type=int,
        required=False,
        default=None,
        help="Minimum charge for the molecules." + "Format example: `--min-charge -1`",
    )
    parser.add_argument(
        "--max-charge",
        type=int,
        required=False,
        default=None,
        help="Maximum charge for the molecules." + "Format example: `--max-charge 2`",
    )
    parser.add_argument(
        "--max-uhf",
        type=int,
        required=False,
        default=None,
        help="Maximum number of unpaired electrons (UHF) for the molecules."
        + " Format example: `--max-uhf 2`",
    )
    parser.add_argument(
        "--min-num-atoms",
        type=int,
        required=False,
        default=None,
        help="Minimum number of atoms for the molecules."
        + " Format example: `--min-num-atoms 2`",
    )
    parser.add_argument(
        "--max-num-atoms",
        type=int,
        required=False,
        default=None,
        help="Maximum number of atoms for the molecules."
        + " Format example: `--max-num-atoms 10`",
    )
    parser.add_argument(
        "--method", type=str, required=True, default="", help="Method to evaluate"
    )
    parser.add_argument(
        "--format",
        type=int,
        required=False,
        default=13,
        help="Energy format ID to evaluate (see FORMATS.md for the full list, "
        + "e.g. 0=Turbomole energy file, 13=ORCA). Correction modifiers "
        + "(+100 vdW, +200 CP, +300 vdW+CP, +400 ABC, +1000 ZPE, +2000 ZPE+thermal) "
        + "may be added on top of a base ID.",
    )
    parser.add_argument(
        "--write-to-csv",
        action="store_true",
        default=False,
        help="Write the detailed GMTKN55 results to a CSV file.",
    )
    parser.add_argument(
        "--strict",
        action="store_true",
        default=False,
        help="Strict mode: Fail with an error if reactions cannot be evaluated unexpectedly.",
    )
    return parser.parse_args()


def parse_required_elements(parsed_args: argparse.Namespace) -> list[tuple]:
    """
    required elements is a list of tuples
    one tuple per set of required elements that must be contained at the same time
    e.g. [(55, 56)] means that both 55 and 56 must be contained in the molecule
    [(54),(55)] means that either 54 or 55 must be contained in the molecule
    """
    required_elements: list[tuple] = []
    if parsed_args.required_elements_all and parsed_args.required_elements_one:
        raise ValueError(
            "Both --required-elements-all and "
            + "--required-elements-one cannot be provided at the same time."
        )
    if parsed_args.required_elements_all:
        required_elements_all = parse_element_list(parsed_args.required_elements_all)
        required_elements.append(tuple(required_elements_all))
    if parsed_args.required_elements_one:
        required_elements_one = parse_element_list(parsed_args.required_elements_one)
        for elem in required_elements_one:
            required_elements.append(tuple([elem]))
    if parsed_args.verbosity > 0:
        print(f"Required elements: {required_elements}")
    return required_elements


def evaluate_subset(
    mols: list[Molecule],
    dataframe: pd.DataFrame,
    verbosity: int,
    config: MoleculeConstraints,
    subset: str,
    method: str,
    res_format: int,
    strictmode: bool = False,
    res_file: str = ".res",
) -> pd.DataFrame:
    """Evaluate a subset of GMTKN55 and return a dataframe."""
    allowed_mols = check_molecule_composition(
        mols,
        verbosity,
        config,
    )
    if verbosity > 2:
        for mol in allowed_mols:
            print(f"Allowed molecule: {mol.name}")
    allowed_mols_names = [mol.name for mol in allowed_mols]
    res_file_path = Path(subset + "/" + res_file).resolve()
    res_lines = res_file_path.read_text(encoding="utf8").splitlines()
    filtered_res_lines, reactions, stochiometries = filter_res_file(
        res_lines, set(allowed_mols_names)
    )

    if reactions:
        definitions = parse_res_reactions(filtered_res_lines, method, res_format)
    else:
        print(f"No valid reactions found in {subset}.")
        definitions = []

    subset_path = Path(subset).resolve()
    results: list[ReactionResult] = []
    evaluated_indices: list[int] = []
    for index, definition in enumerate(definitions):
        try:
            result = evaluate_reaction(definition, subset_path)
        except (MissingEnergyError, ImplausibleResultError) as exc:
            if strictmode:
                print(
                    f"Errors while evaluating subset {subset}. "
                    + "Aborting evaluation in strict mode."
                )
                raise
            if verbosity > 1:
                print(f"Skipping reaction in {subset}: {exc}")
            continue
        results.append(result)
        evaluated_indices.append(index)

    if len(reactions) != len(results) and verbosity > 0:
        print(
            f"Warning for subset {subset}:\n"
            + f"The formal number of reactions ({len(reactions)}) in subset {subset} "
            + f"does not match the number of evaluated reactions ({len(results)})."
        )
        missing_indices = set(range(len(reactions))) - set(evaluated_indices)
        for miss_index in missing_indices:
            print(
                f"Reaction '{reactions[miss_index]}' with stochiometry "
                + f"'{stochiometries[miss_index]}' could not be evaluated."
            )

    # NOTE: Special case for BH76RC
    if res_file == ".resRC" and subset == "BH76":
        subset = subset + "RC"
    rows: list[list] = []
    for index, result in zip(evaluated_indices, results):
        rows.append(
            [
                subset,
                reactions[index],
                stochiometries[index],
                result.definition.reference_value,
                result.calculated_value,
            ]
        )
    new_rows = pd.DataFrame(
        rows,
        columns=["Subset", "Reaction", "Stochiometry", "ReferenceValue", "MethodValue"],
    ).astype(
        {
            "Subset": str,
            "Reaction": str,
            "Stochiometry": str,
            "ReferenceValue": float,
            "MethodValue": float,
        }
    )
    if not (new_rows.empty or dataframe.empty):
        return pd.concat([dataframe, new_rows], ignore_index=True)
    if new_rows.empty:
        return dataframe
    return new_rows


def main(parsed_args: argparse.Namespace) -> int:
    """Main function that is called when the script is executed from the command line."""
    verbosity = parsed_args.verbosity
    required_elements = parse_required_elements(parsed_args)
    allowed_elements = parse_element_list(parsed_args.allowed_elements)
    constrain_config = MoleculeConstraints(
        allowed_elements=allowed_elements,
        required_elements=required_elements,
        min_charge=parsed_args.min_charge,
        max_charge=parsed_args.max_charge,
        max_uhf=parsed_args.max_uhf,
        min_num_atoms=parsed_args.min_num_atoms,
        max_num_atoms=parsed_args.max_num_atoms,
    )
    if verbosity > 0:
        print(constrain_config)

    base_format_id, *_ = split_method_modifiers(parsed_args.format)
    if base_format_id not in ENERGY_READERS:
        print(
            f"Error: format id {parsed_args.format} (base id {base_format_id}) "
            + "has no registered energy reader. See FORMATS.md for supported IDs."
        )
        return 1

    if verbosity > 0:
        print("## Analyzing molecules from filesystem ##")
    gmtkn_mol_dict = get_molecules_from_filesystem(verbosity=verbosity)
    gmtkn_results = pd.DataFrame(
        columns=["Subset", "Reaction", "Stochiometry", "ReferenceValue", "MethodValue"]
    )
    try:
        for subset, mol_list in tqdm(
            gmtkn_mol_dict.items(), desc="Evaluating subsets"
        ):
            if verbosity > 2:
                print(f"\n### {subset} ####")
            gmtkn_results = evaluate_subset(
                mols=mol_list,
                dataframe=gmtkn_results,
                verbosity=verbosity,
                config=constrain_config,
                subset=subset,
                method=parsed_args.method,
                res_format=parsed_args.format,
                strictmode=parsed_args.strict,
            )
            if subset == "BH76":
                # NOTE: BH76 is a special case
                gmtkn_results = evaluate_subset(
                    mols=mol_list,
                    dataframe=gmtkn_results,
                    verbosity=verbosity,
                    config=constrain_config,
                    subset=subset,
                    method=parsed_args.method,
                    res_format=parsed_args.format,
                    strictmode=parsed_args.strict,
                    res_file=".resRC",
                )
    except EvaluationError as exc:
        print(f"Aborting: {exc}")
        return 1

    if verbosity > 0:
        print("\n### Results ###")
        print(gmtkn_results)
    if verbosity > 2:
        with pd.option_context(
            "display.max_rows",
            None,
            "display.max_columns",
            None,
            "display.width",
            None,
            "display.max_colwidth",
            None,
        ):
            print(gmtkn_results)

    # calculate the statistics
    wtmad2s, subset_statistics = stats(gmtkn_results, verbosity)
    if parsed_args.write_to_csv:
        # write the results to a csv file
        gmtkn_results.to_csv(
            f"{parsed_args.method}_reactions.csv", index=False, float_format="%.6f"
        )
        # write the statistics to a csv file
        pd.DataFrame.from_dict(subset_statistics, orient="index").to_csv(
            f"{parsed_args.method}_statistics.csv", index=True, float_format="%.6f"
        )
        pd.DataFrame.from_dict(wtmad2s, orient="index", columns=["WTMAD-2"]).to_csv(
            f"{parsed_args.method}_wtmad2.csv", index=True, float_format="%.6f"
        )
        if verbosity > 0:
            print(
                f"\nDetailed results written to '{parsed_args.method}_reactions.csv' "
                + f"with {len(gmtkn_results)} entries."
            )
            print(
                f"Statistics written to '{parsed_args.method}_statistics.csv' and "
                + f"'{parsed_args.method}_wtmad2.csv'."
            )

    return 0


if __name__ == "__main__":
    # Execute the main function and exit with its return code
    args = get_args()
    raise SystemExit(main(args))
