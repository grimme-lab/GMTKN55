# GMTKN55 Benchmark Evaluator

This project provides a Python-based evaluation framework for computing WTMAD-2 and other statistical metrics on the [GMTKN55](https://pubs.rsc.org/en/content/articlelanding/2017/cp/c7cp04913g) benchmark suite.
It processes `.res` files, filters molecules based on chemical constraints, and parses output to compute evaluation metrics such as WTMAD-2, MAE, and more.

## 📦 Features

- Automatically parses GMTKN55 benchmark subsets from a local filesystem
- Filters molecules based on charge, number of unpaired electrons, and required/allowed elements
- Evaluates reactions using `.res` or `.resRC` files and a user-specified method
- Computes WTMAD-2 and per-category metrics (e.g. small reactions, NCI, barrier heights)
- Exports results to CSV if requested
- Includes a progress bar and detailed verbosity levels

## 🛠 Requirements

Install dependencies using conda:

```bash
conda env create -f environment.yaml
conda activate gmtkn55-env
```

The main dependencies are:

- Python ≥ 3.12
- numpy
- pandas
- tqdm

## 📁 Project Structure

```
GMTKN55/
├── eval.py                  # Main entry point for evaluating subsets
├── utils/                   # Contains all Python source code beyond the central eval.py script
│   ├── __init__.py
│   ├── statistics.py        # WTMAD-2 and statistical calculations
│   ├── constants.py         # Constant data
│   └── ...                  # Further Python source files
├── ACONF/                   # Expected location of GMTKN55 subset folders
├── ADIM6/                   # ...
├── .../                     # ...
├── environment.yaml         # Conda environment specification
└── README.md                # This file
```

## 🚀 Usage

Run the evaluation on your local GMTKN55 directory:

```bash
python eval.py --method YOUR_METHOD_NAME --verbosity 1 --write-to-csv
```

**Further optional arguments**

- `--allowed-elements '1-86'`
- `--required-elements-all '6,1'`
- `--required-elements-one '8,7'`
- `--min-charge -1`
- `--max-charge 2`
- `--max-uhf 2`
- `--format 13` (format of the `.res` files (default: 13))
  
**Example:**

```bash
python eval.py --method mydft --verbosity 2 --write-to-csv --allowed-elements '1-20'
```

## 📊 Output

With `--write-to-csv`, the script will generate a file: `<args.format>.csv` containing columns:

- Subset
- Reaction
- Stochiometry
- ReferenceValue
- MethodValue

**Statistics**

The script prints:

- Overall WTMAD-2
- WTMAD-2 per category:
- Small Reactions
- Larger Reactions
- Barrier Heights
- Intermolecular NCI
- Intramolecular NCI
- Optionally: Mean Absolute Error (MAE) per subset

## 👥 Authors

- Marcel Müller
- Contributions welcome!
