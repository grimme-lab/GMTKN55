if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#W2-F12 reference energies (HF/CBS for H2+)
$tmer h{,2+_1.0}/$f       x 1  -1  $w 64.4
$tmer h{,2+_1.25}/$f      x 1  -1  $w 58.9
$tmer h{,2+_1.5}/$f       x 1  -1  $w 48.7
$tmer h{,2+_1.75}/$f      x 1  -1  $w 38.3
$tmer he{,+,2+_1.0}/$f    x 1 1 -1 $w 56.9
$tmer he{,+,2+_1.25}/$f   x 1 1 -1 $w 46.9
$tmer he{,+,2+_1.5}/$f    x 1 1 -1 $w 31.3
$tmer he{,+,2+_1.75}/$f   x 1 1 -1 $w 19.1
$tmer nh3{,+,2+_1.0}/$f   x 1 1 -1 $w 35.9
$tmer nh3{,+,2+_1.25}/$f  x 1 1 -1 $w 25.9
$tmer nh3{,+,2+_1.5}/$f   x 1 1 -1 $w 13.4
$tmer nh3{,+,2+_1.75}/$f  x 1 1 -1 $w  4.9
$tmer h2o{,+,2+_1.0}/$f   x 1 1 -1 $w 39.7
$tmer h2o{,+,2+_1.25}/$f  x 1 1 -1 $w 29.1
$tmer h2o{,+,2+_1.5}/$f   x 1 1 -1 $w 16.9
$tmer h2o{,+,2+_1.75}/$f  x 1 1 -1 $w  9.3
