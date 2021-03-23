if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#(DLPNO-CCSD(T) TightPNO CBS(aug-cc-pVTZ/aug-cc-pVQZ))
#angol15
# structures from Csonka etal JCTC 5, 2009, 679
$tmer C{1,2}/$f   x -1 1 $w     0.86
$tmer C{1,3}/$f   x -1 1 $w     2.28
$tmer C{1,4}/$f   x -1 1 $w     3.08
$tmer C{1,5}/$f   x -1 1 $w     4.60
$tmer C{1,6}/$f   x -1 1 $w     4.87
$tmer C{1,7}/$f   x -1 1 $w     4.16
$tmer C{1,8}/$f   x -1 1 $w     4.38
$tmer C{1,9}/$f   x -1 1 $w     6.19
$tmer C{1,10}/$f  x -1 1 $w    6.18
$tmer C{1,11}/$f  x -1 1 $w    5.65
$tmer C{1,12}/$f  x -1 1 $w    5.59
$tmer C{1,13}/$f  x -1 1 $w    5.93
$tmer C{1,14}/$f  x -1 1 $w    6.31
$tmer C{1,15}/$f  x -1 1 $w    6.22
# glc4
$tmer G{1,2}/$f   x -1 1 $w 0.20
$tmer G{1,3}/$f   x -1 1 $w 6.16
$tmer G{1,4}/$f   x -1 1 $w 5.54
