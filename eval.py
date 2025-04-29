"""
Python script that evaluates GMTKN55.
"""

from pathlib import Path
import argparse
from tqdm import tqdm

from utils import (
    filter_res_file,
    Molecule,
    get_molecules_from_filesystem,
    parse_element_list,
    molecule_has_required_elements,
    check_molecule_composition,
    GMTKN55_DIRS,
)


def get_args() -> argparse.Namespace:
    """
    Get the command line arguments.
    """
    parser = argparse.ArgumentParser(
        description="Detect fragments for a given list of molecules."
    )
    parser.add_argument(
        "--verbosity", "-v", type=int, default=0, help="Verbosity level."
    )
    parser.add_argument(
        "--allowed-elements",
        type=str,
        required=False,
        default=None,
        help="Allowed elements for the molecules. "
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
    return parser.parse_args()


def parse_required_elements(args: argparse.Namespace) -> list[tuple]:
    """
    required elements is a list of tuples
    one tuple per set of required elements that must be contained at the same time
    e.g. [(55, 56)] means that both 55 and 56 must be contained in the molecule
    [(54),(55)] means that either 54 or 55 must be contained in the molecule
    """
    required_elements: list[tuple] = []
    if args.required_elements_all and args.required_elements_one:
        raise ValueError(
            "Both --required-elements-all and "
            + "--required-elements-one cannot be provided at the same time."
        )
    if args.required_elements_all:
        required_elements_all = parse_element_list(args.required_elements_all)
        required_elements.append(tuple(required_elements_all))
    if args.required_elements_one:
        required_elements_one = parse_element_list(args.required_elements_one)
        for elem in required_elements_one:
            required_elements.append(tuple([elem]))
    if args.verbosity > 0:
        print(f"Required elements: {required_elements}")
    return required_elements


def main() -> int:
    """
    Main function that is called when the script is executed
    from the command line.
    """
    args = get_args()
    verbosity = args.verbosity
    required_elements = parse_required_elements(args)
    allowed_elements = parse_element_list(args.allowed_elements)

    gmtkn_mol_dict = get_molecules_from_filesystem(verbosity=verbosity)
    # add all molecules from gmtkn_mol_dict to all_mols
    for subset, mol_list in gmtkn_mol_dict.items():
        if verbosity > 1:
            print(f"\n### {subset} ####")
        allowed_mols = check_molecule_composition(
            mol_list,
            verbosity,
            required_elements,
            allowed_elements,
            args.min_charge,
            args.max_charge,
            args.max_uhf,
        )
        if verbosity > 1:
            for mol in allowed_mols:
                print(mol.name)
        # filter the res file
        # 1. Get all allowed_mols.name entries in a list
        allowed_mols_names = [mol.name for mol in allowed_mols]
        # 2. Get the res file path
        res_file_path = Path(subset + "/.res").resolve()
        res_lines = res_file_path.read_text(encoding="utf8").splitlines()
        filtered_res_lines, contains_reaction = filter_res_file(res_lines, set(allowed_mols_names))
        # 3. Write the filtered res file to ".res_eval"
        if contains_reaction:
            res_file_path_eval = Path(subset + "/.res_eval").resolve()
            with res_file_path_eval.open("w", encoding="utf8") as f:
                for line in filtered_res_lines:
                    f.write(line + "\n")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
