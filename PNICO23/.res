if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer  1{,a,b}/$f  x -1 1 1 $w 1.43
$tmer  2{,a,b}/$f  x -1 1 1 $w 8.02
$tmer  3{,a,b}/$f  x -1 1 1 $w 0.64
$tmer  4{,a,b}/$f  x -1 1 1 $w 4.26
$tmer  5{,a,b}/$f  x -1 1 1 $w 2.86 
$tmer  6{,a,b}/$f  x -1 1 1 $w 1.32
$tmer  7{,a,b}/$f  x -1 1 1 $w 4.29
$tmer  8{,a,b}/$f  x -1 1 1 $w 2.63
$tmer  9{,a,b}/$f  x -1 1 1 $w 4.91 #W1-F12
$tmer  10{,a,b}/$f x -1 1 1 $w 2.21
$tmer  11{,a,b}/$f x -1 1 1 $w 1.40
$tmer  12{,a,b}/$f x -1 1 1 $w 2.62
$tmer  13{,a,b}/$f x -1 1 1 $w 3.98
$tmer  14{,a,b}/$f x -1 1 1 $w 4.10
$tmer  15{,a,b}/$f x -1 1 1 $w 4.34
$tmer  16{,a,b}/$f x -1 1 1 $w 1.78
$tmer  17{,a,b}/$f x -1 1 1 $w 7.10
$tmer  18{,a,b}/$f x -1 1 1 $w 2.35
$tmer  19{,a,b}/$f x -1 1 1 $w 5.95
$tmer  20{,a,b}/$f x -1 1 1 $w 8.18
$tmer  21{,a,b}/$f x -1 1 1 $w 4.92
$tmer  22{,a,b}/$f x -1 1 1 $w 8.03 #W1-F12
$tmer  23{,a,b}/$f x -1 1 1 $w 10.97 #W1-F12
#W2-F12 except when noted; structres taken from: J. Phys. Chem. A 2015, 119, 1642
