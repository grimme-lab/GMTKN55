if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer N3H5_{1,2}/$f x     -1 1 $w    0.90
$tmer N3H5_{1,3}/$f x     -1 1 $w    5.29
$tmer N4H6_{1,2}/$f x     -1 1 $w    0.13
$tmer N4H6_{1,3}/$f x     -1 1 $w    2.33

$tmer N3P3H12_{1,2}/$f x -1 1 $w  12.16

$tmer SI5H12_{1,2}/$f x -1 1 $w    0.10
$tmer SI5H12_{1,3}/$f x -1 1 $w    1.03
$tmer SI5H12_{1,4}/$f x -1 1 $w    3.51

$tmer SI6H12_{1,2}/$f x -1 1 $w    1.69

$tmer P7H7_{1,2}/$f x     -1 1 $w    1.40
$tmer S4O4_{1,2}/$f x     -1 1 $w    4.39

$tmer S8_{1,2}/$f   x     -1 1 $w    9.16

$tmer H2S2O7_{1,2}/$f x -1 1 $w    0.55
$tmer H2S2O7_{1,3}/$f x -1 1 $w    3.55
$tmer H4P2O7_{1,2}/$f x -1 1 $w    1.33
$tmer H4P2O7_{1,3}/$f x -1 1 $w    3.66 
$tmer H4P2O7_{1,4}/$f x -1 1 $w    4.35
# TPSS-D3(BJ)/def2-TZVP opt. and W1F12 dE values (without spin-orbit and DBOC) 
