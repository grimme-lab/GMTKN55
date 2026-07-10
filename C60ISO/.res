if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer {1,2}/$f  x -1 1 $w 37.39
$tmer {1,3}/$f  x -1 1 $w 55.93
$tmer {1,4}/$f  x -1 1 $w 55.79
$tmer {1,5}/$f  x -1 1 $w 68.78

$tmer {1,7}/$f  x -1 1 $w 106.46

$tmer {1,9}/$f  x -1 1 $w 136.12
$tmer {1,10}/$f x -1 1 $w 158.39
#CBS*: newly developed CBS extrapolation scheme + TCutPairs 1e-5 Eh DLPNO-CCSD(T)
##est. error: +/-1.0 [kcal/mol] (conservatively)
##with ORCA prerelease 3.1
##Entries 6 and 8 were removed due to spin contamination.
