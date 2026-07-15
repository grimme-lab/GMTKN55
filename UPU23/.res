if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

# estimated CCSD(T)/CBS* after Hansen/Grimme: scaled MP2/CBS(DT) , DLPNO-CCSD(T)/def2-TZVP with TCutPairs 1e-5
# first half of original set
$tmer {2p,1a}/$f  x -1 1 $w  4.87
$tmer {2p,1b}/$f  x -1 1 $w  2.97
$tmer {2p,1c}/$f  x -1 1 $w  8.90
$tmer {2p,1g}/$f  x -1 1 $w  2.22
$tmer {2p,1p}/$f  x -1 1 $w  2.02
$tmer {2p,2a}/$f  x -1 1 $w  3.14
$tmer {2p,5z}/$f  x -1 1 $w  0.57
$tmer {2p,6p}/$f  x -1 1 $w  3.32
$tmer {2p,7a}/$f  x -1 1 $w  7.26
$tmer {2p,aa}/$f  x -1 1 $w  3.96
$tmer {2p,1e}/$f  x -1 1 $w  11.13
$tmer {2p,0a}/$f  x -1 1 $w  4.82
$tmer {2p,1f}/$f  x -1 1 $w  14.41
$tmer {2p,9a}/$f  x -1 1 $w  5.15
$tmer {2p,4b}/$f  x -1 1 $w  5.48
$tmer {2p,3a}/$f  x -1 1 $w  6.84
$tmer {2p,7p}/$f  x -1 1 $w  3.90
$tmer {2p,8d}/$f  x -1 1 $w  6.43
$tmer {2p,3d}/$f  x -1 1 $w  5.42
$tmer {2p,0b}/$f  x -1 1 $w  6.70
$tmer {2p,1m}/$f  x -1 1 $w  5.60
$tmer {2p,2h}/$f  x -1 1 $w  10.42
$tmer {2p,3b}/$f  x -1 1 $w  6.09
