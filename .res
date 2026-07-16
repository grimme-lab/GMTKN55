#!/usr/bin/env bash

set -euo pipefail
trap "echo Exited!; exit;" SIGINT SIGTERM SIGHUP

# Name of the functional (for '<func>/energy' files)
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <functional> (for '<func>/energy' files)"
  exit 1
fi
func=$1

# Flag for tmer2++ (13 = orca.out, 0 = TM energy file)
w=${2:-13}

##############################################################################

# Script has to be in same directory as this `.res` script.
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
stat_script="${script_dir}/_utils/pystat2.py"

if [ ! -x "${stat_script}" ]; then
  echo "Error: ${stat_script} not found or not executable"
  exit 1
fi

printf "Using ${stat_script} for statistics.\n\n"

##############################################################################

# silence pushd/popd
pushd() {
  command pushd "$@" >/dev/null
}
popd() {
  command popd "$@" >/dev/null
}

##############################################################################

for i in W4-11 G21EA G21IP DIPCS10 PA26 SIE4x4 ALKBDE10 YBDE18 AL2X6 HEAVYSB11 NBPRC ALK8 RC21 G2RC; do
  echo $i
  pushd $i
  bash .res "$func" "$w" | awk '{print $8, $6}' | $stat_script >.${func}.out
  popd
done

echo BH76
pushd BH76
bash .resRC "$func" "$w" | awk '{print $8, $6}' | $stat_script >.${func}_RC.out
popd

for i in FH51 TAUT15 DC13 MB16-43 DARC RSE43; do
  echo $i
  pushd $i
  bash .res "$func" "$w" | awk '{print $8, $6}' | $stat_script >.${func}.out
  popd
done

for i in BSR36 CDIE20 ISO34 ISOL24 C60ISO PArel BH76 BHPERI BHDIV10 INV24 BHROT27 PX13 WCPT18; do
  echo $i
  pushd $i
  bash .res "$func" "$w" | awk '{print $8, $6}' | $stat_script >.${func}.out
  popd
done

for i in RG18 ADIM6 S22 S66 HEAVY28 WATER27 CARBHB12 PNICO23 HAL59 AHB21 CHB6 IL16; do
  echo $i
  pushd $i
  bash .res "$func" "$w" | awk '{print $8, $6}' | $stat_script >.${func}.out
  popd
done

for i in IDISP ICONF ACONF Amino20x4 PCONF21 MCONF SCONF UPU23 BUT14DIOL; do
  echo $i
  pushd $i
  bash .res "$func" "$w" | awk '{print $8, $6}' | $stat_script >.${func}.out
  popd
done
