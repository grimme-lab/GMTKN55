if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#Revised reference values by Sherrill and co-workers (S22B)
#J Chem. Phys 135, 194102 (2011).
$tmer 01{,a}/$f    x -1 2    $w 3.133   0   1  nh3
$tmer 02{,a}/$f    x -1 2    $w 4.989   0   1  h2o
$tmer 03{,a}/$f    x -1 2    $w 18.753  0   1  formac
$tmer 04{,a}/$f    x -1 2    $w 16.062  0   1  formam
$tmer 05{,a}/$f    x -1 2    $w 20.641  0   1  uracil
$tmer 06{,a,b}/$f  x -1 1 1  $w 16.934  0   1  pyridone 
$tmer 07{,a,b}/$f  x -1 1 1  $w 16.66  0   1  AT
##
$tmer 08{,a}/$f    x -1 2    $w 0.527  0  1 ch4
$tmer 09{,a}/$f    x -1 2    $w 1.472  0  1 ethene
$tmer 10{,a,b}/$f  x -1 1 1  $w 1.448  0  1 bzch4
$tmer 11{,a}/$f    x -1 2    $w 2.654  0  1 bzpd
$tmer 12{,a}/$f    x -1 2    $w 4.255  0  1 pyraz 
$tmer 13{,a}/$f    x -1 2    $w 9.805 0  1 uracil
$tmer 14{,a,b}/$f  x -1 1 1  $w 4.524  0  1 indolebz
$tmer 15{,a,b}/$f  x -1 1 1  $w 11.73 0  1 AT S
##
$tmer 16{,a,b}/$f  x -1 1 1  $w 1.496  0 1 ethenine
$tmer 17{,a,b}/$f  x -1 1 1  $w 3.275  0 1 bzh2o
$tmer 18{,a,b}/$f  x -1 1 1  $w 2.312  0 1 bznh3
$tmer 19{,a,b}/$f  x -1 1 1  $w 4.541  0 1 bzhcn
$tmer 20{,a,b}/$f  x -1 1 1  $w 2.717  0 1 bzT 
$tmer 21{,a,b}/$f  x -1 1 1  $w 5.627  0 1 indolbz
$tmer 22{,a,b}/$f  x -1 1 1  $w 7.097  0 1 phenol
