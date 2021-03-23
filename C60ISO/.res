if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer {1,2}/$f  x -1 1 $w 37.40 
$tmer {1,3}/$f  x -1 1 $w 56.87
$tmer {1,4}/$f  x -1 1 $w 56.89
$tmer {1,5}/$f  x -1 1 $w 69.89
$tmer {1,6}/$f  x -1 1 $w 100.48
$tmer {1,7}/$f  x -1 1 $w 111.72
$tmer {1,8}/$f  x -1 1 $w 142.18
$tmer {1,9}/$f  x -1 1 $w 143.96
$tmer {1,10}/$f x -1 1 $w 164.88
#CBS*: newly developed CBS extrapolation scheme + TCutPairs 1e-5 Eh DLPNO-CCSD(T)
##est. error: +/-1.0 [kcal/mol] (conservatively)
##with ORCA prerelease 3.1
