if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#barrier heights (uncatalyzed reaction)
$tmer {reac,ts}1/$f   x -1 1 $w 36.76       #W2.2
$tmer {reac,ts}2/$f   x -1 1 $w 36.21       #W2.2
$tmer {reac,ts}3/$f   x -1 1 $w 60.95       #W2.2
$tmer {reac,ts}4/$f   x -1 1 $w 47.52       #W2.2
$tmer {reac,ts}5/$f   x -1 1 $w 65.68       #W2.2
$tmer {reac,ts}6/$f   x -1 1 $w 81.24       #W2.2
$tmer {reac,ts}7/$f   x -1 1 $w 32.00       #W2.2
$tmer {reac,ts}8/$f   x -1 1 $w 28.97       #W2.2
$tmer {reac,ts}9/$f   x -1 1 $w 58.80       #W2.2
#barrier heights (catalyzed reaction with one water molecule)
$tmer {reac1,h2o,ts1h2o}/$f   x -1 -1 1 $w  5.40       #W2.2
$tmer {reac2,h2o,ts2h2o}/$f   x -1 -1 1 $w  2.68       #W2.2
$tmer {reac3,h2o,ts3h2o}/$f   x -1 -1 1 $w 28.78       #W2.2
$tmer {reac4,h2o,ts4h2o}/$f   x -1 -1 1 $w  8.68       #W2.2
$tmer {reac5,h2o,ts5h2o}/$f   x -1 -1 1 $w 33.89       #W2.2
$tmer {reac6,h2o,ts6h2o}/$f   x -1 -1 1 $w 59.63       #W2.2
$tmer {reac7,h2o,ts7h2o}/$f   x -1 -1 1 $w  5.83       #W2.2
$tmer {reac8,h2o,ts8h2o}/$f   x -1 -1 1 $w  3.54       #W2.2
$tmer {reac9,h2o,ts9h2o}/$f   x -1 -1 1 $w 33.22       #W2.2
