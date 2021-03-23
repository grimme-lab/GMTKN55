if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#wrt to complexes and not the separate monomers (diffrent to the Karton, Radom paper)
$tmer nh3_2{,_ts}/$f  x  -1  1   $w 59.3
$tmer nh3_3{,_ts}/$f  x  -1  1   $w 46.9
$tmer nh3_4{,_ts}/$f  x  -1  1   $w 48.4
$tmer h2o_2{,_ts}/$f  x  -1  1   $w 48.6
$tmer h2o_3{,_ts}/$f  x  -1  1   $w 29.8
$tmer h2o_4{,_ts}/$f  x  -1  1   $w 26.6
$tmer h2o_5{,_ts}/$f  x  -1  1   $w 30.1
$tmer h2o_6{,_ts}/$f  x  -1  1   $w 35.1
$tmer hf_2{,_ts}/$f   x  -1  1   $w 42.3
$tmer hf_3{,_ts}/$f   x  -1  1   $w 20.7
$tmer hf_4{,_ts}/$f   x  -1  1   $w 14.7
$tmer hf_5{,_ts}/$f   x  -1  1   $w 14.6
$tmer hf_6{,_ts}/$f   x  -1  1   $w 16.6
