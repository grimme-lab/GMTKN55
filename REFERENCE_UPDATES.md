# GMTKN55 Reference Update and Python Evaluation

This repository contains selected updates to GMTKN55 reference data,
spin-contamination exclusions, and a Python implementation of the GMTKN55
evaluation workflow.

## Reference updates

Updated reference values are included for:

* `C60ISO` (https://doi.org/10.26434/chemrxiv.15003369/v1)
* `ISOL24` (https://doi.org/10.1021/acs.jctc.3c00270)
* `UPU23`
* `S66` (https://doi.org/10.1080/00268976.2022.2109526)
* `G2IP`, `G2EA`
* `WATER27` (https://doi.org/10.1021/acs.jctc.6b01046 and https://arxiv.org/abs/2308.06120)
* `BH76`, `BH76RC` (https://doi.org/10.1021/jp801805p)
* `BHPERI`, `BHDIV10`, `PX13` (from https://doi.org/10.1021/acs.jpca.9b0461)

The updated `UPU23` references were already present in the main GMTKN55
repository.

After applying the exclusions below, the benchmark contains 1495 retained
reactions. Among these, 251 reference values differ from the original dataset:

| Subset    | Changed references |
| --------- | -----------------: |
| C60ISO    |                  7 |
| ISOL24    |                 21 |
| UPU23     |                 23 |
| S66       |                 66 |
| BH76      |                 23 |
| BH76RC    |                 10 |
| G21EA     |                 25 |
| G21IP     |                 36 |
| BHPERI    |                  6 |
| PX13      |                  4 |
| BHDIV10   |                  3 |
| WATER27   |                 27 |
| **Total** |            **251** |

## Spin-contamination exclusions

Entries identified as significantly spin contaminated were excluded when the
corresponding benchmark reference relied on restricted CCSD(T), following the
screening reported by Liang and Head-Gordon:

J. Liang and M. Head-Gordon, J. Chem. Theory Comput. **2025**.
DOI: `10.1021/acs.jctc.5c01380`

| Subset   | Affected structures                                 |
| -------- | --------------------------------------------------- |
| C60ISO   | `C60ISO_6`, `C60ISO_8`                              |
| CARBHB12 | `1CL`, `1CL_B`, `1N`, `1N_B`, `1O`, `1O_B`, `2CL_B` |
| DIPCS10  | `h2s_2+`                                            |
| G2RC     | `6`                                                 |
| INV24    | `PCl3_TS`                                           |
| ISOL24   | `i11p`                                              |

These exclusions remove 10 benchmark reactions in total.

## Evaluation

`eval.py` evaluates GMTKN55 `.res` and `.resRC` definitions directly in Python
and reproduces the energy-reading format semantics of `tmer2`.

The legacy `tmer2`-based workflow is retained in `eval_tmer.py` for
compatibility and reproducibility.

Example:

```bash
python eval.py --method PBEh-3c --format 13
```

Results can be written to CSV with:

```bash
python eval.py \
  --method PBEh-3c \
  --format 13 \
  --write-to-csv
```

## WTMAD-2 comparison

For direct comparison with the original GMTKN55 results, the legacy WTMAD-2
normalization constant is retained:

```text
S = 56.84 kcal/mol
```

Using the updated local reference data, the recomputed normalization constant is:

```text
S(updated) = 57.386 kcal/mol
```

The legacy value is used for the original-versus-updated comparison below.

### Tested methods

| Method  | Dispersion correction | Original | Updated | ΔWTMAD-2 |
|---------|-----------------------|---------:|--------:|---------:|
| B2PLYP  | D3(BJ)                |     3.88 |    3.79 |   -0.087 |
| PWPB95  | D3(BJ)                |     4.00 |    3.97 |   -0.031 |
| PW6B95  | D3(BJ)                |     5.50 |    5.49 |  -0.0091 |
| B3LYP   | D3(BJ)                |     6.36 |    6.33 |   -0.034 |
| PBE0    | D3(BJ)                |     6.58 |    6.52 |   -0.064 |
| PWPB95  | /                     |     6.54 |    6.52 |   -0.022 |
| revTPSS | D3(BJ)                |     8.44 |    8.41 |   -0.030 |
| B2PLYP  | /                     |     8.59 |    8.57 |   -0.021 |
| PW6B95  | /                     |     8.81 |    8.82 |  +0.0083 |
| PBE     | D3(BJ)                |    10.39 |   10.30 |   -0.081 |
| PBE0    | /                     |    10.92 |   10.91 |  -0.0046 |
| PW91    | D3(BJ)                |    11.16 |   11.07 |   -0.094 |
| PW91    | /                     |    13.78 |   13.73 |   -0.054 |
| PBE     | /                     |    13.86 |   13.83 |   -0.029 |
| revTPSS | /                     |    13.94 |   13.95 |   +0.016 |
| B3LYP   | /                     |    16.20 |   16.26 |   +0.063 |

The reference updates and exclusions produce only small WTMAD-2 changes for the
tested methods.

