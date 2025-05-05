"""
Based on MindlessGen
- utilities for filtering compounds based on allowed and forbidden elements.
- check if the molecule has the required elements
- parse the allowed elements from a string
"""

from tqdm import tqdm

from .molecule import Molecule


def parse_element_list(allowed_elements: str) -> list[int]:
    """
    Parse the allowed elements from a string.
    """
    set_allowed_elements: set[int] = set()
    if not allowed_elements:
        return list(set_allowed_elements)
    elements = allowed_elements.split(",")
    elements = [element.strip() for element in elements]

    for item in elements:
        if "-" in item:
            start: str | int
            end: str | int
            start, end = item.split("-")
            if end == "*" and start == "*":
                raise ValueError("Both start and end cannot be wildcard '*'.")
            if end == "*":
                end = 103  # Set to a the maximum atomic number in mindlessgen
            if start == "*":
                start = 0
            set_allowed_elements.update(
                range(int(start) - 1, int(end))
            )  # Subtract 1 to convert to 0-based indexing
        else:
            set_allowed_elements.add(
                int(item) - 1
            )  # Subtract 1 to convert to 0-based indexing

    return sorted(list(set_allowed_elements))


def molecule_has_required_elements(
    mol: Molecule, required_elements: list[tuple], verbosity: int
) -> bool:
    """
    Check whether a molecule contains the required elements.
    """
    # loop over all tuples of required element combinations
    contained_combinations: list[bool] = [False] * len(required_elements)
    for k, req_elem in enumerate(required_elements):
        # list of boolean values with the same length as the number of req_elem
        contained: list[bool] = [False] * len(req_elem)
        for i, ati in enumerate(req_elem):
            # check if the required element is in the molecule
            if ati in mol.ati:
                contained[i] = True
        # check if all elements of the respective required element combination are found
        if all(contained):
            contained_combinations[k] = True
    # check if any of the combinations is True
    if any(contained_combinations):
        if verbosity > 2:
            print(f"Molecule {mol.name} has the required elements.")
        return True
    if verbosity > 2:
        print(f"Molecule {mol.name} does not have the required elements.")
    return False


def check_molecule_composition(
    mols: list[Molecule],
    verbosity: int,
    required_elements: list[tuple],
    allowed_elements: list[int],
    min_charge: int | None,
    max_charge: int | None,
    max_uhf: int | None,
) -> list[Molecule]:
    """
    Check the composition of the molecules and filter them based on the
    allowed and forbidden elements.
    """
    allowed_mols: list[Molecule] = []
    hide_progress = verbosity < 3
    for mol in tqdm(
        mols, desc="Checking composition...", unit="molecule", disable=hide_progress
    ):
        # check if all elements in the molecule are allowed
        if allowed_elements:
            if all(ati in allowed_elements for ati in mol.ati):
                if verbosity > 2:
                    print(f"Molecule {mol.name} has only allowed elements.")
            else:
                if verbosity > 2:
                    print(f"Molecule {mol.name} has forbidden elements.")
                continue
        if required_elements and (
            not molecule_has_required_elements(mol, required_elements, verbosity)
        ):
            continue

        if min_charge is not None and mol.charge < min_charge:
            if verbosity > 2:
                print(f"Molecule {mol.name} has charge {mol.charge}.")
            continue
        if max_charge is not None and mol.charge > max_charge:
            if verbosity > 2:
                print(f"Molecule {mol.name} has charge {mol.charge}.")
            continue
        if max_uhf is not None and mol.uhf > max_uhf:
            if verbosity > 2:
                print(f"Molecule {mol.name} has UHF {mol.uhf}.")
            continue

        allowed_mols.append(mol)

    return allowed_mols
