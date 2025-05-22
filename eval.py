"""
Python script that evaluates GMTKN55.
"""

import subprocess as sp
from pathlib import Path
import argparse

import pandas as pd
from tqdm import tqdm

from utils import (
    filter_res_file,
    parse_res_file,
    Molecule,
    get_molecules_from_filesystem,
    parse_element_list,
    check_molecule_composition,
    MoleculeConstraints,
    stats,
)


def get_args() -> argparse.Namespace:
    """
    Get the command line arguments.
    """
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
        "--format", type=int, required=False, default=13, help="Format to evaluate"
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
    """
    Evaluate a subset of GMTKN55 and return a dataframe.
    """
    allowed_mols = check_molecule_composition(
        mols,
        verbosity,
        config,
    )
    if verbosity > 2:
        for mol in allowed_mols:
            print(f"Allowed molecule: {mol.name}")
    # filter the res file
    # 1. Get all allowed_mols.name entries in a list
    allowed_mols_names = [mol.name for mol in allowed_mols]
    # 2. Get the res file path
    res_file_path = Path(subset + "/" + res_file).resolve()
    res_lines = res_file_path.read_text(encoding="utf8").splitlines()
    filtered_res_lines, reactions, stochiometries = filter_res_file(
        res_lines, set(allowed_mols_names)
    )
    # 3. Write the filtered res file to ".res_eval"
    # if reactions is not empty, we can evaluate the reactions
    if reactions:
        res_file_path_eval = Path(subset + "/" + res_file + "_eval").resolve()
        with res_file_path_eval.open("w", encoding="utf8") as f:
            for line in filtered_res_lines:
                f.write(line + "\n")
        result = sp.run(
            ["bash", str(res_file_path_eval), method, str(res_format)],
            check=True,
            capture_output=True,
            text=True,
            # change working directory to the subset directory
            cwd=Path(subset).resolve(),
        )
        try:
            res_data: list[tuple[int, float, float]] = parse_res_file(
                result.stdout, strictmode, verbosity
            )
        except ValueError as e:
            print(
                f"Errors while parsing the '.res' file output for subset {subset}. "
                + "Aborting evaluation in strict mode."
            )
            raise e
    else:
        print(f"No valid reactions found in {subset}.")
        res_data = []
    # 4. Add the results to the dataframe
    # before: Check if systems_per_reaction and ref_comp_array have the same length
    if len(reactions) != len(res_data) and verbosity > 0:
        print(
            f"Warning for subset {subset}:\n"
            + f"The formal number of reactions ({len(reactions)}) in subset {subset} "
            + f"does not match the number of evaluated reactions ({len(res_data)})."
        )
        # check which index is missing
        missing_indices = set(range(len(reactions))) - {index for index, *_ in res_data}
        for miss_index in missing_indices:
            print(
                f"Reaction '{reactions[miss_index]}' with stochiometry "
                + f"'{stochiometries[miss_index]}' could not be parsed."
            )
    # NOTE: Special case for BH76RC
    if res_file == ".resRC" and subset == "BH76":
        subset = subset + "RC"
    rows: list[list] = []
    for index, ref, comp in res_data:
        rows.append([subset, reactions[index], stochiometries[index], ref, comp])
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
    """
    Main function that is called when the script is executed
    from the command line.
    """
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

    if verbosity > 0:
        print("## Analyzing molecules from filesystem ##")
    gmtkn_mol_dict = get_molecules_from_filesystem(verbosity=verbosity)
    gmtkn_results = pd.DataFrame(
        columns=["Subset", "Reaction", "Stochiometry", "ReferenceValue", "MethodValue"]
    )
    # add all molecules from gmtkn_mol_dict to all_mols
    for subset, mol_list in tqdm(gmtkn_mol_dict.items(), desc="Evaluating subsets"):
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
