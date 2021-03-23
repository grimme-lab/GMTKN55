if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer EA_c{,-}/$f   x 1 -1 $w  29.2 
$tmer EA_o{,-}/$f   x 1 -1 $w  33.7 
$tmer EA_f{,-}/$f   x 1 -1 $w  78.4 
$tmer EA_si{,-}/$f  x 1 -1 $w  32.1 
$tmer EA_p{,-}/$f   x 1 -1 $w  17.3 
$tmer EA_s{,-}/$f   x 1 -1 $w  48.0 
$tmer EA_cl{,-}/$f  x 1 -1 $w  83.5 
$tmer EA_8{n,}/$f   x 1 -1 $w  27.9 
$tmer EA_9{n,}/$f   x 1 -1 $w  13.4 
$tmer EA_10{n,}/$f  x 1 -1 $w   1.2 
$tmer EA_11{n,}/$f  x 1 -1 $w   8.3 
$tmer EA_12{n,}/$f  x 1 -1 $w  16.8 
$tmer EA_13{n,}/$f  x 1 -1 $w  41.7 
$tmer EA_14{n,}/$f  x 1 -1 $w  29.3 
$tmer EA_15{n,}/$f  x 1 -1 $w  25.1 
$tmer EA_16{n,}/$f  x 1 -1 $w  31.4 
$tmer EA_17{n,}/$f  x 1 -1 $w  23.5 
$tmer EA_18{n,}/$f  x 1 -1 $w  28.8 
$tmer EA_19{n,}/$f  x 1 -1 $w  54.2 
$tmer EA_20{n,}/$f  x 1 -1 $w   9.5 
$tmer EA_21{n,}/$f  x 1 -1 $w  -0.2 
$tmer EA_22{n,}/$f  x 1 -1 $w  89.5 
$tmer EA_23{n,}/$f  x 1 -1 $w  24.9 
$tmer EA_24{n,}/$f  x 1 -1 $w  38.0 
$tmer EA_25{n,}/$f  x 1 -1 $w  54.7 

