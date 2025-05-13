"""
Filter a .res file to include only reactions with all valid species.
"""

import re


def extract_species_from_path(path: str) -> list[str]:
    """
    Extract compound and its species from a string like:
    - '01_10{P,R1,R2}/$func/' → ['01_10P', '01_10R1', '01_10R2'] → BASE BEFORE EXISTS
    - '{DMML_REACT,DMML_INT1}/$f' → ['DMML_REACT', 'DMML_INT1'] → NO BASE
    - '{ed,ts}1/$f' → ['ed1', 'ts1'] → BASE AFTER EXISTS
    - 'A{M,D}2/$f' → ['AM2', 'AD2'] → BASE BEFORE AND AFTER EXISTS
    """
    # Explicitly match base{species}, {species}, or {species}base
    match_base_before_and_after = re.match(
        r"(?P<prefix>[^{}]+)\{(?P<species>[^}]+)\}(?P<suffix>[^/]+)", path
    )
    match_base_before = re.match(r"(?P<base>[^{}]+)/?\{(?P<species>[^}]+)\}", path)
    match_base_after = re.match(r"\{(?P<species>[^}]+)\}(?P<base>[^/]+)", path)
    match_no_base = re.match(r"\{(?P<species>[^}]+)\}", path)

    if match_base_before_and_after:
        prefix = match_base_before_and_after.group("prefix")
        suffix = match_base_before_and_after.group("suffix")
        species = [
            s.strip() for s in match_base_before_and_after.group("species").split(",")
        ]
        return [f"{prefix}{s}{suffix}" for s in species]

    if match_base_before:
        base = match_base_before.group("base")
        species = [s.strip() for s in match_base_before.group("species").split(",")]
        return [f"{base}{s}" for s in species]

    if match_base_after:
        base = match_base_after.group("base")
        species = [s.strip() for s in match_base_after.group("species").split(",")]
        return [f"{s}{base}" for s in species]

    if match_no_base:
        species = [s.strip() for s in match_no_base.group("species").split(",")]
        return species

    raise ValueError(
        f"Invalid format for species extraction: {path}. "
        + "Expected format like 'base{{species}}', '{{species}}', or '{{species}}base'."
    )


def filter_res_file(
    res_lines: list[str], valid_species: set[str]
) -> tuple[list[str], list[list[str]], list[list[int]]]:
    """
    Filter the lines of a .res file to include only those with valid species.
    """
    result = []
    list_reaction_species: list[list[str]] = []
    list_stochiometries: list[list[int]] = []
    for line in res_lines:
        stripped = line.strip()
        if not stripped or stripped.startswith("#"):
            result.append(line)
            continue

        tokens = stripped.split()
        if not (
            "x" in tokens
            and (tokens[0].startswith("$tmer") or tokens[0].startswith("tmer"))
        ):
            # Here, we assume that the line is not a valid tmer entry
            # but just prepending lines in bash so we just append the line to the result
            result.append(line)
            continue

        # Here, we assume that the line is a valid tmer entry
        # Collect all species-related tokens between $tmer and the 'x' token
        species_tokens: list[str] = []
        for token in tokens[1:]:
            if token == "x":
                break
            species_tokens.append(token)

        stochiometry_start = tokens.index("x") + 1
        stochiometry_values = []
        for token in tokens[stochiometry_start:]:
            if token.startswith("$w"):
                break
            stochiometry_values.append(int(token))

        species: list[str] = []
        for token in species_tokens:
            relevant_paths = token.split("/")
            token_to_search: str = ""
            for relevant_path in relevant_paths:
                relevant_path = relevant_path.strip()
                if relevant_path.startswith("$") or not relevant_path:
                    # Skip empty tokens or those starting with $
                    continue
                token_to_search = relevant_path
            if not token_to_search:
                continue
            if "{" in token_to_search and "}" in token_to_search:
                species.extend(extract_species_from_path(token_to_search))
            else:
                species.append(token_to_search)
        unique_species = set(species)
        if all(s in valid_species for s in unique_species):
            result.append(line)
            list_reaction_species.append(species)
            list_stochiometries.append(stochiometry_values)

    return result, list_reaction_species, list_stochiometries


def parse_res_file(
    res_file_content: str, verbosity: int
) -> list[tuple[int, float, float]]:
    """
     Parse the result of a .res file execution.

    -158.106240453700   -158.105609208100      0.000000000000      0.000000000000      0.000000000000    0.39611   -0.20189    0.59800   B_T/PBEhB_G/PBEh
    -197.333891140300   -197.333186851700      0.000000000000      0.000000000000      0.000000000000    0.44195   -0.17205    0.61400   P_TT/PBEP_TG/PBE
    -197.333891140300   -197.332961886700      0.000000000000      0.000000000000      0.000000000000    0.58312   -0.37788    0.96100   P_TT/PBEP_GG/PBE
    -197.333891140300   -197.329711152500      0.000000000000      0.000000000000      0.000000000000    2.62298   -0.19002    2.81300   P_TT/PBEP_GX/PBE
    ...
    """
    data: list[tuple[int, float, float]] = []
    index = -1
    for line in res_file_content.splitlines():
        line = line.strip()
        if not line:
            continue
        tokens = line.split()
        # Let the index start from 0, and increment it only for non-empty lines
        index += 1
        if len(tokens) >= 8:
            try:
                ref_energy = float(tokens[7].strip())
                comp_energy = float(tokens[5].strip())
                if abs(ref_energy - comp_energy) > 750:
                    if verbosity > 1:
                        print(
                            "Skipping line due to excessively large difference "
                            + f"between reference and computed energy: {line}"
                        )
                    continue
                data.append((index, ref_energy, comp_energy))
            except ValueError:
                if verbosity > 1:
                    print("Conversion to floats not possible for line:", line)
                continue
        else:
            if verbosity > 1:
                print("Not enough tokens in line:", line)
            continue
    return data
