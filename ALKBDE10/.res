if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer bef/$f be/$f f/$f x -1 1 1 $w 138.7
$tmer beo/$f be/$f o/$f x -1 1 1 $w 106.6
$tmer cao/$f ca/$f o/$f x -1 1 1 $w 96.2
$tmer hf/$f  h/$f  f/$f x -1 1 1 $w 142.1
$tmer kf/$f  k/$f  f/$f x -1 1 1 $w 117.5
$tmer lif/$f li/$f f/$f x -1 1 1 $w 139.2
$tmer lio/$f li/$f o/$f x -1 1 1 $w 82.5
$tmer mgo/$f mg/$f o/$f x -1 1 1 $w 62.2
$tmer mgs/$f mg/$f s/$f x -1 1 1 $w 56.7
$tmer nao/$f na/$f o/$f x -1 1 1 $w 65.2
#ZPVE-corrected experimental values taken from Truhlar and co-workers, JCTC, 2015, 11, 2968.
##PW6B95-D3(BJ)/def2-QZVP structures
