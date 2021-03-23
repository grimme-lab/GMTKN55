if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#nonrelativistic W1-F12 reference energies.
##Extrapolation exponent for the CCSDF12CORR=3.38 for reactions containing H and 2nd row atoms only.
##PBE0-D3(BJ)/def2-TZVP optimized geometries
#
##alpha cleavage
$tmer {1e,1p1,me}/$f  x  -1 1 1       $w 23.43
$tmer {1e,1p2,1p3}/$f  x  -1 1 1      $w 26.66
$tmer {2e,2p1,me}/$f  x  -1 1 1       $w 24.74
$tmer {2e,2p2,2p3}/$f  x  -1 1 1      $w 59.44
#
##benzylium formation vs tropylium rearrangement
$tmer {3e,3p1,3p2}/$f  x  -1 1 1      $w 57.93
$tmer {3e,3int1}/$f  x -1 1           $w 36.56
$tmer {3e,3int2}/$f  x -1 1           $w 17.91
$tmer {3e,3int3}/$f  x -1 1           $w 16.80
$tmer {3e,3p2,3p3}/$f  x -1 1 1       $w 49.85
#
##allyl cleavage
$tmer {4e,4p,me}/$f  x  -1 1 1        $w 45.16
#
##alkane cleavage
$tmer {5e,5p,me}/$f  x -1 1 1         $w 22.24
#
##2-pentanone (McL & competitors)
$tmer {6e,6int}/$f  x -1 1            $w -6.72
$tmer {6e,6p1,ethylene}/$f  x -1 1 1  $w 21.21
$tmer {6e,6p3,me}/$f  x -1 1 1        $w 22.03
$tmer {6e,1p2,pr}/$f  x -1 1 1        $w 28.12
#
##isocrotonic acid (H2O elimination & competitors)
$tmer {7e,7p1,7p2}/$f  x -1 1 1       $w -0.73
$tmer {7e,7p3,7p4}/$f  x -1 1 1       $w 50.66
$tmer {7e,7p5,7p6}/$f  x -1 1 1       $w 30.38
#
##Retro Diels Alder
$tmer {8e,8p1,ethylene}/$f  x -1 1 1  $w 49.73
#
##Phenol CO loss
$tmer {9e,9p1,9p2}/$f  x -1 1 1       $w 32.81
#
##Pyridine HCN loss
$tmer {10e,10p1,10p2}/$f  x -1 1 1    $w 126.56
