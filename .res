#!/usr/bin/env sh

func=$1
suffix=-d4
w=113
module load pystat/2

for i in W4-11 G21EA G21IP DIPCS10 PA26 SIE4x4 ALKBDE10 YBDE18 AL2X6 HEAVYSB11 NBPRC ALK8 RC21 G2RC
do
  pushd $i
  bash .res "$func" "$w" | awk '{print $8, $6}' | pystat > .${func}${suffix}.out
  popd
done

pushd BH76
bash .resRC "$func" "$w" | awk '{print $8, $6}' | pystat > .${func}${suffix}_RC.out
popd

for i in FH51 TAUT15 DC13 MB16-43 DARC
do
  pushd $i
  bash .res "$func" "$w" | awk '{print $8, $6}' | pystat > .${func}${suffix}.out
  popd
done

for i in RSE43
do
  pushd $i
  bash .res "$func" "$w" | awk '{print $7}' > .out
  paste .ref .out | pystat > .${func}${suffix}.out
  popd
done

for i in BSR36 CDIE20 ISO34 ISOL24 C60ISO PArel BH76 BHPERI BHDIV10 INV24 BHROT27 PX13 WCPT18
do
  pushd $i
  bash .res "$func" "$w" | awk '{print $8, $6}' | pystat > .${func}${suffix}.out
  popd
done

for i in RG18 ADIM6 S22 S66 HEAVY28 WATER27 CARBHB12 PNICO23 HAL59 AHB21 CHB6 IL16
do
  pushd $i
  bash .res "$func" "$w" | awk '{print $8, $6}' | pystat > .${func}${suffix}.out
  popd
done

for i in IDISP ICONF ACONF Amino20x4 PCONF21 MCONF SCONF UPU23 BUT14DIOL
do
  pushd $i
  bash .res "$func" "$w" | awk '{print $8, $6}' | pystat > .${func}${suffix}.out
  popd
done
