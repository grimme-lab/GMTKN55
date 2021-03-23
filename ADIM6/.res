if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer A{M,D}2/$f   x 2 -1 $w 1.34 0 1.0
$tmer A{M,D}3/$f   x 2 -1 $w 1.99 0 1.0
$tmer A{M,D}4/$f   x 2 -1 $w 2.89 0 1.0
$tmer A{M,D}5/$f   x 2 -1 $w 3.78 0 1.0
$tmer A{M,D}6/$f   x 2 -1 $w 4.60 0 1.0
$tmer A{M,D}7/$f   x 2 -1 $w 5.55 0 1.0

#W1-F12, for 6 and 7 with TM
