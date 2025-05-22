"""
Based on MindlessGen
- utilities for filtering compounds based on allowed and forbidden elements.
- check if the molecule has the required elements
- parse the allowed elements from a string
"""

from tqdm import tqdm

from .molecule import Molecule


class MoleculeConstraints:
    """
    Class to hold the constraints for the molecules.
    """

    def __init__(
        self,
        allowed_elements: list[int],
        required_elements: list[tuple],
        min_charge: int | None,
        max_charge: int | None,
        max_uhf: int | None,
        min_num_atoms: int | None = None,
        max_num_atoms: int | None = None,
    ) -> None:
        self.allowed_elements = allowed_elements
        self.required_elements = required_elements
        if min_charge is not None and max_charge is not None:
            if min_charge > max_charge:
                raise ValueError(
                    f"Minimum charge ({min_charge}) "
                    + f"cannot be greater than maximum charge ({max_charge})."
                )
        self.min_charge = min_charge
        self.max_charge = max_charge
        self.max_uhf = max_uhf
        if min_num_atoms is not None and max_num_atoms is not None:
            if min_num_atoms > max_num_atoms:
                raise ValueError(
                    f"Minimum number of atoms ({min_num_atoms}) "
                    + f"cannot be greater than maximum number of atoms ({max_num_atoms})."
                )
        self.min_num_atoms = min_num_atoms
        self.max_num_atoms = max_num_atoms

    def __str__(self) -> str:
        return (
            f"Allowed elements: {self.allowed_elements}\n"
            f"Required elements: {self.required_elements}\n"
            f"Minimal charge: {self.min_charge}\n"
            f"Maximal charge: {self.max_charge}\n"
            f"Maximal number of unpaired electrons: {self.max_uhf}\n"
            f"Minimal number of atoms: {self.min_num_atoms}\n"
            f"Maximal number of atoms: {self.max_num_atoms}\n"
        )


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
                end = 103  # Set to the maximum atomic number
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
    molecule_constraints: MoleculeConstraints,
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
        # check if the number of atoms is within the limits
        if (
            molecule_constraints.min_num_atoms is not None
            and mol.num_atoms < molecule_constraints.min_num_atoms
        ):
            if verbosity > 2:
                print(
                    f"Molecule {mol.name} has only {mol.num_atoms} atoms. "
                    + f"Minimum is {molecule_constraints.min_num_atoms}."
                )
            continue
        if (
            molecule_constraints.max_num_atoms is not None
            and mol.num_atoms > molecule_constraints.max_num_atoms
        ):
            if verbosity > 2:
                print(
                    f"Molecule {mol.name} has {mol.num_atoms} atoms. "
                    + f"Maximum is {molecule_constraints.max_num_atoms}."
                )
            continue
        # check if all elements in the molecule are allowed
        if molecule_constraints.allowed_elements:
            if all(ati in molecule_constraints.allowed_elements for ati in mol.ati):
                if verbosity > 2:
                    print(f"Molecule {mol.name} has only allowed elements.")
            else:
                if verbosity > 2:
                    print(f"Molecule {mol.name} has forbidden elements.")
                continue
        if molecule_constraints.required_elements and (
            not molecule_has_required_elements(
                mol, molecule_constraints.required_elements, verbosity
            )
        ):
            continue

        if (
            molecule_constraints.min_charge is not None
            and mol.charge < molecule_constraints.min_charge
        ):
            if verbosity > 2:
                print(f"Molecule {mol.name} has charge {mol.charge}.")
            continue
        if (
            molecule_constraints.max_charge is not None
            and mol.charge > molecule_constraints.max_charge
        ):
            if verbosity > 2:
                print(f"Molecule {mol.name} has charge {mol.charge}.")
            continue
        if (
            molecule_constraints.max_uhf is not None
            and mol.uhf > molecule_constraints.max_uhf
        ):
            if verbosity > 2:
                print(f"Molecule {mol.name} has UHF {mol.uhf}.")
            continue

        allowed_mols.append(mol)

    return allowed_mols
