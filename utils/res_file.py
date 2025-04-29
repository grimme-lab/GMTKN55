"""
Filter a .res file to include only reactions with all valid species.
"""

import re

import numpy as np


def extract_species_from_path(path: str) -> list[str]:
    """
    Extract compound and its species from a string like:
    - '01_10{P,R1,R2}/$func/' → ['01_10P', '01_10R1', '01_10R2']
    - '{DMML_REACT,DMML_INT1}/$f' → ['DMML_REACT', 'DMML_INT1']
    """
    match = re.match(r"(?:(?P<base>[^{}]+))?\{(?P<species>[^}]+)\}", path)
    if not match:
        raise ValueError(
            f"Invalid format for species extraction: {path}. Expected format: 'base{{species}}'."
        )

    base = match.group("base") or ""
    species = [s.strip() for s in match.group("species").split(",")]

    if base:
        return [f"{base}{s}" for s in species]
    return species


def filter_res_file(
    res_lines: list[str], valid_species: set[str]
) -> tuple[list[str], bool]:
    """
    Filter the lines of a .res file to include only those with valid species.
    """
    result = []
    valid_reaction_found = False
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
        # make the species a set of unique species
        unique_species = set(species)
        if all(s in valid_species for s in unique_species):
            valid_reaction_found = True
            result.append(line)

    return result, valid_reaction_found


def parse_res_file(res_file_content: str) -> np.ndarray:
    """
     Parse the content of a .res file.

    -158.106240453700   -158.105609208100      0.000000000000      0.000000000000      0.000000000000    0.39611   -0.20189    0.59800   B_T/PBEhB_G/PBEh
    -197.333891140300   -197.333186851700      0.000000000000      0.000000000000      0.000000000000    0.44195   -0.17205    0.61400   P_TT/PBEP_TG/PBE
    -197.333891140300   -197.332961886700      0.000000000000      0.000000000000      0.000000000000    0.58312   -0.37788    0.96100   P_TT/PBEP_GG/PBE
    -197.333891140300   -197.329711152500      0.000000000000      0.000000000000      0.000000000000    2.62298   -0.19002    2.81300   P_TT/PBEP_GX/PBE
    ...
    """
    data = [
        (float(line.split()[7]), float(line.split()[5]))
        for line in res_file_content.splitlines()
        if line.strip()
    ]
    result_array = np.array(data)
    return result_array
