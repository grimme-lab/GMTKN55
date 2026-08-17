if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

# G21EA revised W3 reference values
$tmer EA_c{,-}/$f   x 1 -1 $w   29.435
$tmer EA_o{,-}/$f   x 1 -1 $w   33.984
$tmer EA_f{,-}/$f   x 1 -1 $w   79.214
$tmer EA_si{,-}/$f  x 1 -1 $w   32.696
$tmer EA_p{,-}/$f   x 1 -1 $w   17.060
$tmer EA_s{,-}/$f   x 1 -1 $w   48.211
$tmer EA_cl{,-}/$f  x 1 -1 $w   84.401
$tmer EA_8{n,}/$f   x 1 -1 $w   27.772
$tmer EA_9{n,}/$f   x 1 -1 $w   13.829
$tmer EA_10{n,}/$f  x 1 -1 $w    0.189
$tmer EA_11{n,}/$f  x 1 -1 $w    8.368
$tmer EA_12{n,}/$f  x 1 -1 $w   17.287
$tmer EA_13{n,}/$f  x 1 -1 $w   42.461
$tmer EA_14{n,}/$f  x 1 -1 $w   29.068
$tmer EA_15{n,}/$f  x 1 -1 $w   24.765
$tmer EA_16{n,}/$f  x 1 -1 $w   31.189
$tmer EA_17{n,}/$f  x 1 -1 $w   23.378
$tmer EA_18{n,}/$f  x 1 -1 $w   28.900
$tmer EA_19{n,}/$f  x 1 -1 $w   53.939
$tmer EA_20{n,}/$f  x 1 -1 $w    9.794
$tmer EA_21{n,}/$f  x 1 -1 $w    0.275
$tmer EA_22{n,}/$f  x 1 -1 $w   89.087
$tmer EA_23{n,}/$f  x 1 -1 $w   25.401
$tmer EA_24{n,}/$f  x 1 -1 $w   38.248
$tmer EA_25{n,}/$f  x 1 -1 $w   54.993
