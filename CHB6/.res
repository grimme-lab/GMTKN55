if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer 22{,A,B}/$f  x 1 -1 -1 $w -34.43
$tmer 23{,A,B}/$f  x 1 -1 -1 $w -23.83
$tmer 24{,A,B}/$f  x 1 -1 -1 $w -17.83
$tmer 25{,A,B}/$f  x 1 -1 -1 $w -39.09
$tmer 26{,A,B}/$f  x 1 -1 -1 $w -25.63
$tmer 27{,A,B}/$f  x 1 -1 -1 $w -19.90
