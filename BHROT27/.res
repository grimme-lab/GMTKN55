if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer ethane_{st,ecl}/$f         x -1 1  $w  2.73 #W2-F12
$tmer tmethane_{60,0}/$f         x -1 1  $w  7.01 #W1-F12
$tmer tmethane_{60,120}/$f       x -1 1  $w  3.46 #W1-F12
$tmer tmethane_{180,120}/$f      x -1 1  $w  3.72 #W1-F12
$tmer methanol_{st,ecl}/$f       x -1 1  $w  1.01 #W2-F12
$tmer methylamine_{st,ecl}/$f    x -1 1  $w  2.28 #W2-F12
$tmer h2o2{,_trans}/$f           x -1 1  $w  1.01 #W2-F12
$tmer h2o2{,_cis}/$f             x -1 1  $w  7.17 #W2-F12
$tmer h2s2{,_trans}/$f           x -1 1  $w  5.79 #W2-F12
$tmer h2s2{,_cis}/$f             x -1 1  $w  8.03 #W2-F12
$tmer n2h4_{st1,ecl1}/$f         x -1 1  $w  1.62 #W2-F12
$tmer n2h4_{st1,ecl2}/$f         x -1 1  $w  8.41 #W2-F12
$tmer nh2oh_{st1,ecl}/$f         x -1 1  $w  6.91 #W2-F12
$tmer nh2oh_{st2,ecl}/$f         x -1 1  $w  2.68 #W2-F12
$tmer acetamide_{RC,TS1}/$f      x -1 1  $w 17.24 #W2-F12 
$tmer acetamide_{RC,TS2}/$f      x -1 1  $w 14.52 #W2-F12 
$tmer biphenyl{,_TS}/$f          x -1 1  $w  2.10 #W1-F12
$tmer bifuran_{anti,TS}/$f       x -1 1  $w  3.89 #W1-F12
$tmer bifuran_{syn,TS}/$f        x -1 1  $w  2.09 #W1-F12
$tmer bithiophene_{anti,TS}/$f   x -1 1  $w  1.78 #W1-F12
$tmer bithiophene_{syn,TS}/$f    x -1 1  $w  1.39 #W1-F12 
$tmer butadiene_{strans,TS}/$f   x -1 1  $w  6.30 #W2-F12
$tmer butadiene_{scis,TS}/$f     x -1 1  $w  3.35 #W2-F12
$tmer ethylthiourea_{180,TS1}/$f x -1 1  $w 10.36 #W1-F12
$tmer ethylthiourea_{0,TS1}/$f   x -1 1  $w 10.24 #W1-F12
$tmer ethylthiourea_{180,TS2}/$f x -1 1  $w 17.20 #W1-F12
$tmer ethylthiourea_{0,TS2}/$f   x -1 1  $w 17.08 #W1-F12
