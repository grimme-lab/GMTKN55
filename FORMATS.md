# GMTKN55 `--format` ID reference

This is a reference for the `--format` IDs supported by `eval.py`'s
`ENERGY_READERS` registry. It mirrors the base-method IDs understood by the
legacy `tmer2++` program (`gete()` in `tmer2.f`); IDs not listed here (e.g.
`49`) have no reader and cause `eval.py` to fail immediately with a clear
`UnsupportedFormatError` rather than silently returning `0.0`.

## Correction modifiers

A `--format` value can be a base ID plus one of the following offsets, which
add a correction term on top of the base energy (see `split_method_modifiers`
in `eval.py`):

| Offset  | Effect                                             |
| ------- | --------------------------------------------------- |
| `+100`  | van der Waals dispersion correction (`.EDISP`)       |
| `+200`  | Counterpoise correction (`.CPC`)                     |
| `+300`  | vdW + counterpoise (both of the above)               |
| `+400`  | 3-body (ABC) dispersion term (`dftd3.out`)           |
| `+1000` | Zero-point vibrational energy (CRYSTAL `freq/crystal.out`) |
| `+2000` | ZPE + thermal energy correction                      |

For example, `--format 313` reads format `13` (ORCA) with vdW and
counterpoise corrections added.

## Base format IDs

| ID | Reader function                       | Source file(s)                    | Notes |
| -- | -------------------------------------- | ---------------------------------- | ----- |
| 0  | `read_turbomole_energy`                | `energy`                           | Last row, SCF column (field 2) of the `$energy` block |
| 1  | `read_b2plyp_energy`                   | `plyp.out`                         | B2PLYP-style double hybrid |
| 2  | `read_scs_mp2_energy`                  | `mp2.out`                          | SCS-MP2 |
| 3  | `read_mp3_energy`                      | `mp3.out`                          | MP3 correlation energy |
| 4  | `read_qcisd_t_energy`                  | `qci.out`                          | QCISD(T) |
| 5  | `read_mp2_energy`                      | `mp2.out`                          | MP2 |
| 6  | `read_b2plyp_energy`                   | `plyp.out`                         | Same reader as format 1 |
| 7  | `read_gaussian_energy`                 | `g.out`                            | Gaussian "SCF Done" energy |
| 8  | `read_molpro_energy` (mode 3)          | `ccsdt.out`                        | CCSD(T) minus MP2 |
| 9  | `read_b2plyp_energy`                   | `plyp.out`                         | Same reader as format 1 (xDH-style scaling handled upstream) |
| 10 | `read_corval_delta`                    | `.CORVAL`                          | Core-valence + core-polarization correction |
| 11 | `read_cbs_corval_ccsdt_energy`         | `.CORVAL`, `.CBS`, `ccsdt.out`     | CBS + delta-CCSD(T) + core-valence |
| 12 | `read_cbs_ccsdt_energy`                | `.CBS`, `ccsdt.out`                | CBS + delta-CCSD(T) |
| 13 | `read_orca_energy`                     | `orca.out`                         | ORCA `FINAL SINGLE POINT ENERGY` |
| 14 | `read_molpro_energy` (mode 2)          | `ccsdt.out`                        | CCSD(T) |
| 15 | `read_turbomole_mvd_energy`            | `scf.out`                          | Mass-velocity-Darwin (scalar relativistic) correction; reference/energy_add/error_multiplier are not parsed for this format (mirrors tmer2++) |
| 16 | `read_cbs_energy`                      | `.CBS`                             | CBS-extrapolated energy |
| 17 | `read_mp2_5_energy`                    | `.CBS`, `mp3.out` (or `.E3`)       | MP2.5 = CBS + 0.5 x MP3 correction |
| 18 | `read_evdw_energy`                     | `coord` (via external `evdw`)      | **Only format still shelling out to an external program** (see below) |
| 19 | `read_nwchem_energy`                   | `nw.out`                           | NWChem total DFT energy |
| 20 | `read_eat_energy`                      | `.EAT`                             | Atomization energy correction (kcal/mol -> Hartree, sign-flipped) |
| 21 | `read_h298_energy`                     | `.H298`                            | Enthalpy of formation at 298 K |
| 22 | `read_ehtenergy`                       | `ehtenergy`                        | Extended-Hueckel energy |
| 23 | `read_dftbplus_energy`                 | `detailed.out`                     | DFTB+ total energy |
| 24 | `read_turbomole_scf_energy`             | `scf.out`                          | Turbomole SCF total energy |
| 25 | `read_turbomole_scf_energy` (no D3)     | `scf.out`                          | As 24, with the D3 dispersion term removed |
| 26 | `read_qcisd_t_minus_mp2_energy`        | `qci.out`                          | QCISD(T) minus MP2 |
| 27 | `read_g298_energy`                     | `.G298`                            | Free energy of formation at 298 K |
| 28 | `read_snf_energy` (mode 1)             | `snf.out`                          | SNF enthalpy correction |
| 29 | `read_snf_energy` (mode 2)             | `snf.out`                          | SNF Gibbs free energy correction |
| 30 | `read_scalar_file(".CPC")`             | `.CPC`                             | Counterpoise correction |
| 31 | `read_vasp_energy`                     | `OUTCAR`                           | VASP "energy without entropy" (eV -> Hartree) |
| 32 | `read_edisp_energy`                    | `.EDISP`                           | Dispersion correction |
| 33 | `read_crystal_energy`                  | `crystal.out`                      | CRYSTAL total energy |
| 34 | `read_crystal_energy_with_edisp`       | `crystal.out`, `.EDISP`            | CRYSTAL total energy + dispersion correction |
| 35 | `read_orca_scnl_energy`                | `orca.out`                         | ORCA "SC+NL" energy |
| 36 | `read_orca_scnl_scaled_energy`         | `orca.out`                         | As 35, scaled by `SCNL_SCALE` |
| 37 | `read_turbomole_cpc_edisp_energy`      | `energy`, `.CPC`, `.EDISP`         | Turbomole SCF + CP + dispersion |
| 38 | `read_turbomole_half_cpc_edisp_energy` | `energy`, `.CPC`, `.EDISP`         | Dispersion + half SCF + CP |
| 39 | `read_hfc_energy`                      | `hfc.out`                          | Total energy from `hfc.out` |
| 40 | `read_crystal_postscf_energy`          | `crystal.out`                      | CRYSTAL post-SCF (e.g. MP2) energy |
| 41 | `read_ancopt_energy`                   | `ancopt.out`                       | Optimized energy |
| 42 | `read_ancopt_energy_with_abc`          | `ancopt.out`, `dftd3.out`          | As 41, plus a 3-body dispersion term |
| 43 | `read_turbomole_cpc_energy`            | `energy`, `.CPC`                   | Turbomole SCF + CP correction |
| 44 | `read_turbomole_energy` (field 3)      | `energy`                           | SCFKIN column |
| 45 | `read_turbomole_energy` (field 4)      | `energy`                           | SCFPOT column |
| 46 | `read_scalar_file(".msindo")`          | `.msindo`                          | Semiempirical MSINDO energy |
| 47 | `read_driver_energy`                   | `.DRIVER`                          | Generic scalar driver output |
| 48 | `read_crystal14_energy`                | `crystal.out`                      | CRYSTAL14-style total energy |
| 49 | *(unsupported)*                        | -                                   | No reader registered; raises `UnsupportedFormatError` |
| 50 | `read_crystal_primitive_cell_energy`   | `crystal.out`                      | CRYSTAL primitive-cell energy |
| 51 | `read_vasp_volume_energy`              | `OUTCAR`                           | VASP cell-volume-derived quantity |
| 52 | `read_adf_energy`                      | `adf.out`                          | ADF total energy (Hartree) |
| 53 | `read_scalar_file(".DFTC")`            | `.DFTC`                             | Scalar energy correction |
| 54 | `read_dirac_energy`                    | `dirac_struc.out`                  | DIRAC total energy |
| 55 | `read_molpro_ks_energy`                | `molpro.out`                       | Molpro Kohn-Sham total energy |

## The `evdw` exception

Format `18` is the one remaining case where `eval.py` shells out to an
external program (`evdw <coord>`). `evdw` is a small standalone utility
unrelated to `tmer2++`, with no pure-Python equivalent available in this
repository, so it is kept as a documented, isolated exception to the
"no external dependencies" goal of this refactor. A missing `evdw` binary or
missing `coord` file yields `0.0`, which is treated as a missing energy like
every other reader.

