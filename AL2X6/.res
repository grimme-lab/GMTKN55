if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer  al2h6/$f  alh3/$f    x  -1  2    $w  38.5
$tmer  al2f6/$f  alf3/$f    x  -1  2    $w  51.6
$tmer  al2cl6/$f  alcl3/$f    x  -1  2    $w  32.5
$tmer  al2me4/$f  alme2/$f    x  -1  2    $w  38.4
$tmer  al2me5/$f  alme2/$f  alme3/$f  x  -1  1  1  $w  31.2
$tmer  al2me6/$f  alme3/$f    x  -1  2    $w  23.1
#all systems have been recalcuated with W2-F12, except for the last one, for which W1-F12 was used. Br case was omitted from the old set.
