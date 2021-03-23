if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#DLPNO-CCSD(T) TCutPairs 10^-5 Eh CBS(aug-cc-pVTZ/aug-cc-pVQZ)
#(estimated uncertainty: +/- 0.25 kcal/mol)
$tmer {antdimer,ant}/$f     x  1 -2  $w -9.15 
$tmer {pxylene,pc22,h2}/$f  x  2 -1 -2  $w -60.28
$tmer octane{1,2}/$f        x  1 -1  $w -1.21 
$tmer undecan{1,2}/$f       x  1 -1  $w  9.10 
$tmer F14{f,l}/$f           x -1  1  $w -3.64
$tmer F22{f,l}/$f           x -1  1  $w -1.96
