if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

ref=2p
# estimated CCSD(T)/CBS* after Hansen/Grimme: scaled MP2/CBS(DT) , DLPNO-CCSD(T)/def2-TZVP with TCutPairs 1e-5
# first half of original set
$tmer {$ref,1a}/$f  x -1 1 $w  4.87
$tmer {$ref,1b}/$f  x -1 1 $w  2.97
$tmer {$ref,1c}/$f  x -1 1 $w  8.90
$tmer {$ref,1g}/$f  x -1 1 $w  2.22
$tmer {$ref,1p}/$f  x -1 1 $w  2.02
$tmer {$ref,2a}/$f  x -1 1 $w  3.14
$tmer {$ref,5z}/$f  x -1 1 $w  0.57
$tmer {$ref,6p}/$f  x -1 1 $w  3.32
$tmer {$ref,7a}/$f  x -1 1 $w  7.26
$tmer {$ref,aa}/$f  x -1 1 $w  3.96
$tmer {$ref,1e}/$f  x -1 1 $w  11.13
$tmer {$ref,0a}/$f  x -1 1 $w  4.82
$tmer {$ref,1f}/$f  x -1 1 $w  14.41
$tmer {$ref,9a}/$f  x -1 1 $w  5.15
$tmer {$ref,4b}/$f  x -1 1 $w  5.48
$tmer {$ref,3a}/$f  x -1 1 $w  6.84
$tmer {$ref,7p}/$f  x -1 1 $w  3.90
$tmer {$ref,8d}/$f  x -1 1 $w  6.43
$tmer {$ref,3d}/$f  x -1 1 $w  5.42
$tmer {$ref,0b}/$f  x -1 1 $w  6.70
$tmer {$ref,1m}/$f  x -1 1 $w  5.60
$tmer {$ref,2h}/$f  x -1 1 $w  10.42
$tmer {$ref,3b}/$f  x -1 1 $w  6.09
