"""
Python module for statistical functions.
This module contains functions for calculating the MAE and WTMAD-2.
"""

import numpy as np
import pandas as pd

from .constants import (
    SMALL_REACTION_DIRS,
    LARGE_REACTION_DIRS,
    BARRIER_DIRS,
    INTERMOL_NCI_DIRS,
    INTRAMOL_NCI_DIRS,
)


def statistical_measures(subset_data: pd.DataFrame) -> dict[str, int | float]:
    """
    Calculate the statistics for a subset of the dataframe.
    """
    errors = subset_data["ReferenceValue"] - subset_data["MethodValue"]
    stats_dict = {
        "N": len(subset_data),
        "MeanAbsRef": np.mean(np.abs(subset_data["ReferenceValue"])),
        "MAE": np.mean(np.abs(errors)),
        "MSE": np.mean(errors),
        "STDDEV": np.std(errors, ddof=1),
        "RMSD": np.sqrt(np.mean(errors**2)),
        "MAX": np.max(errors),
        "MIN": np.min(errors),
        "ErrRange": np.max(errors) - np.min(errors),
    }
    return stats_dict


def stats(
    df: pd.DataFrame, verbosity: int
) -> tuple[dict[str, float], dict[str, dict[str, int | float]]]:
    r"""
    Calculate the WTMAD-2 of the dataframe.

    \begin{equation}
    \text{WTMAD-2} = \frac{1}{\sum\limits_{i=1}^{N} N_i} \cdot \sum\limits_{i=1}^{N} N_i \cdot \left( \frac{\langle |\Delta E| \rangle}{|\Delta E|_i} \right) \cdot \text{MAD}_i
    \end{equation}
    Where:
    - N is the total number of subsets (e.g., 55 for GMTKN55),
    - N_i is the number of data points in subset i,
    - \langle |\Delta E| \rangle is the average of the average absolute reference energies over all subsets,
    - |\Delta E|_i is the average absolute reference energy for subset i,
    - \text{MAD}_i is the mean absolute deviation for subset i.
    """
    wtmad2_dict: dict[str, float] = {}

    # Calculate average deltaE_i for each subset
    subset_stats: dict[str, dict[str, int | float]] = {}

    for subset in df["Subset"].unique():
        subset_df = df[df["Subset"] == subset]
        subset_stats[subset] = statistical_measures(subset_df)

    total_number_reactions = sum(stats["N"] for stats in subset_stats.values())
    if total_number_reactions == 0:
        raise ValueError("No reactions found in the dataset.")

    average_mean_reference_energy: float = float(
        np.mean([stats["MeanAbsRef"] for stats in subset_stats.values()])
    )

    # WTMAD-2 for the entire dataset
    wtmad2_dict["total"] = 0.0
    for subset in df["Subset"].unique():
        wtmad2_dict["total"] += (
            subset_stats[subset]["N"]
            * average_mean_reference_energy
            * subset_stats[subset]["MAE"]
            / subset_stats[subset]["MeanAbsRef"]
        )
    wtmad2_dict["total"] /= total_number_reactions

    # WTMAD-2 for the subcategories

    ## Basic properties and reaction energies for small systems
    wtmad2_dict["smallreactions"] = 0.0
    category_number_reactions: int = 0
    for subset in SMALL_REACTION_DIRS:
        if subset in df["Subset"].unique():
            category_number_reactions += subset_stats[subset]["N"]  # type: ignore[assignment]
            wtmad2_dict["smallreactions"] += (
                subset_stats[subset]["N"]
                * average_mean_reference_energy
                * subset_stats[subset]["MAE"]
                / subset_stats[subset]["MeanAbsRef"]
            )
    if category_number_reactions == 0:
        print(
            f"Warning: No reactions found in the {SMALL_REACTION_DIRS} category. "
            + "WTMAD-2 for small reactions is not calculated."
        )
        wtmad2_dict["smallreactions"] = np.nan
    else:
        wtmad2_dict["smallreactions"] /= category_number_reactions

    ## Reaction energies for large systems and isomerisation reactions
    wtmad2_dict["largereactions"] = 0.0
    category_number_reactions = 0
    for subset in LARGE_REACTION_DIRS:
        if subset in df["Subset"].unique():
            category_number_reactions += subset_stats[subset]["N"]  # type: ignore[assignment]
            wtmad2_dict["largereactions"] += (
                subset_stats[subset]["N"]
                * average_mean_reference_energy
                * subset_stats[subset]["MAE"]
                / subset_stats[subset]["MeanAbsRef"]
            )
    if category_number_reactions == 0:
        print(
            f"Warning: No reactions found in the {LARGE_REACTION_DIRS} category. "
            + "WTMAD-2 for large reactions is not calculated."
        )
        wtmad2_dict["largereactions"] = np.nan
    else:
        wtmad2_dict["largereactions"] /= category_number_reactions

    ## Reaction barrier heights
    wtmad2_dict["barrierheights"] = 0.0
    category_number_reactions = 0
    for subset in BARRIER_DIRS:
        if subset in df["Subset"].unique():
            category_number_reactions += subset_stats[subset]["N"]  # type: ignore[assignment]
            wtmad2_dict["barrierheights"] += (
                subset_stats[subset]["N"]
                * average_mean_reference_energy
                * subset_stats[subset]["MAE"]
                / subset_stats[subset]["MeanAbsRef"]
            )
    if category_number_reactions == 0:
        print(
            f"Warning: No reactions found in the {BARRIER_DIRS} category. "
            + "WTMAD-2 for barrier heights is not calculated."
        )
        wtmad2_dict["barrierheights"] = np.nan
    else:
        wtmad2_dict["barrierheights"] /= category_number_reactions

    ## Noncovalent interactions
    wtmad2_dict["all_nci"] = 0.0

    ## Intermolecular noncovalent interactions
    wtmad2_dict["intermolecular"] = 0.0
    category_number_reactions = 0
    nci_number_reactions = 0
    for subset in INTERMOL_NCI_DIRS:
        if subset in df["Subset"].unique():
            category_number_reactions += subset_stats[subset]["N"]  # type: ignore[assignment]
            nci_number_reactions += subset_stats[subset]["N"]  # type: ignore[assignment]
            added_error = (
                subset_stats[subset]["N"]
                * average_mean_reference_energy
                * subset_stats[subset]["MAE"]
                / subset_stats[subset]["MeanAbsRef"]
            )
            wtmad2_dict["intermolecular"] += added_error
            wtmad2_dict["all_nci"] += added_error
    if category_number_reactions == 0:
        print(
            f"Warning: No reactions found in the {INTERMOL_NCI_DIRS} category. "
            + "WTMAD-2 for intermolecular noncovalent interactions is not calculated."
        )
        wtmad2_dict["intermolecular"] = np.nan
    else:
        wtmad2_dict["intermolecular"] /= category_number_reactions

    ## Intramolecular noncovalent interactions
    wtmad2_dict["intramolecular"] = 0.0
    category_number_reactions = 0
    for subset in INTRAMOL_NCI_DIRS:
        if subset in df["Subset"].unique():
            category_number_reactions += subset_stats[subset]["N"]  # type: ignore[assignment]
            nci_number_reactions += subset_stats[subset]["N"]  # type: ignore[assignment]
            added_error = (
                subset_stats[subset]["N"]
                * average_mean_reference_energy
                * subset_stats[subset]["MAE"]
                / subset_stats[subset]["MeanAbsRef"]
            )
            wtmad2_dict["intramolecular"] += added_error
            wtmad2_dict["all_nci"] += added_error
    if category_number_reactions == 0:
        print(
            f"Warning: No reactions found in the {INTRAMOL_NCI_DIRS} category. "
            + "WTMAD-2 for intramolecular noncovalent interactions is not calculated."
        )
        wtmad2_dict["intramolecular"] = np.nan
    else:
        wtmad2_dict["intramolecular"] /= category_number_reactions
    if nci_number_reactions == 0:
        print(
            f"Warning: No reactions found in the {INTERMOL_NCI_DIRS} and "
            + f"{INTRAMOL_NCI_DIRS} categories. "
            + "WTMAD-2 for all noncovalent interactions is not calculated."
        )
        wtmad2_dict["all_nci"] = np.nan
    else:
        wtmad2_dict["all_nci"] /= nci_number_reactions

    if verbosity > 0:
        print("\n### WTMAD-2 ###")
        if verbosity > 1:
            print("\nAdditional statistics:")
            print("   Subset    :   N_i   |  <|ΔE|>_i  |  MAE_i")
            print("   --------- : ------- | ----------- | --------")
            for subset in df["Subset"].unique():
                print(
                    f"   {subset:<10}: {subset_stats[subset]['N']:<7} | "
                    + f"{subset_stats[subset]['MeanAbsRef']:<11.3f} | "
                    + f"{subset_stats[subset]['MAE']:<8.3f}"
                )
            print("   --------------------------------------------")
            print(
                f"   Average <|ΔE|> : {average_mean_reference_energy:.3f} "
                + f"| Total N: {total_number_reactions}"
            )
            print("   --------------------------------------------")
        print(f"\n{'Subset':<22}:  WTMAD-2")
        print("-" * 22 + ": --------")
        print(f"{'Total':<22}: {wtmad2_dict['total']:8.3f}")
        print(f"{'Small Reactions':<22}: {wtmad2_dict['smallreactions']:8.3f}")
        print(f"{'Larger Reactions':<22}: {wtmad2_dict['largereactions']:8.3f}")
        print(f"{'Barrier Heights':<22}: {wtmad2_dict['barrierheights']:8.3f}")
        print(f"{'Intermolecular NCI':<22}: {wtmad2_dict['intermolecular']:8.3f}")
        print(f"{'Intramolecular NCI':<22}: {wtmad2_dict['intramolecular']:8.3f}")
        print(f"{'All NCI':<22}: {wtmad2_dict['all_nci']:8.3f}")

    return wtmad2_dict, subset_stats
