if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#NEW REF VALUES BASED ON W1-F12 (A. Kartin, private commun.)
$tmer {ethene,butadiene,P1}/$f  x  -1 -1 1 $w -45.4
$tmer {ethine,butadiene,P2}/$f  x  -1 -1 1 $w -60.8
$tmer {ethene,cpdiene,P3}/$f  x  -1 -1 1 $w -29.9
$tmer {ethine,cpdiene,P4}/$f  x  -1 -1 1 $w -33.6
$tmer {ethene,chdiene,P5}/$f  x  -1 -1 1 $w -37.6
$tmer {ethine,chdiene,P6}/$f  x  -1 -1 1 $w -49.0
$tmer {furane,malein,P7}/$f  x  -1 -1 1 $w -14.0
$tmer {furane,malein,P7X}/$f  x  -1 -1 1 $w -15.9
$tmer {furane,maleinNH,P8}/$f  x  -1 -1 1 $w -16.8
$tmer {furane,maleinNH,P8X}/$f  x  -1 -1 1 $w -18.9
$tmer {cpdiene,malein,P9}/$f  x  -1 -1 1 $w -31.7
$tmer {cpdiene,malein,P9X}/$f  x  -1 -1 1 $w -32.2
$tmer {cpdiene,maleinNH,P10}/$f  x  -1 -1 1 $w -34.2
$tmer {cpdiene,maleinNH,P10X}/$f  x  -1 -1 1 $w -34.6
