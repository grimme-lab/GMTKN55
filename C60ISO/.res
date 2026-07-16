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

##Method: PNO-LCCSD(T*)-F12b/VDZ-F12′, augmented by corrections for core correlation,
basis-set incompleteness, PNO-space incompleteness, and continued-fraction higher-order excitations.

##Entries 6 and 8 were removed due to spin contamination.
