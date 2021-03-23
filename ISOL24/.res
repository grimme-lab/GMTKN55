if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer i1{e,p}/$f  x -1 1   $w  71.01
$tmer i2{e,p}/$f  x -1 1   $w  38.50
$tmer i3{e,p}/$f  x -1 1   $w  10.69
$tmer i4{e,p}/$f  x -1 1   $w  69.03
$tmer i5{e,p}/$f  x -1 1   $w  33.08
$tmer i6{e,p}/$f  x -1 1   $w  24.41
$tmer i7{e,p}/$f  x -1 1   $w  17.88
$tmer i8{e,p}/$f  x -1 1   $w  22.04
$tmer i9{e,p}/$f  x -1 1   $w  21.09
$tmer i10{e,p}/$f x -1 1   $w  6.49
$tmer i11{e,p}/$f x -1 1   $w  36.90
$tmer i12{e,p}/$f x -1 1   $w  0.42
$tmer i13{e,p}/$f x -1 1   $w  33.02
$tmer i14{e,p}/$f x -1 1   $w  5.32
$tmer i15{e,p}/$f x -1 1   $w  4.14
$tmer i16{e,p}/$f x -1 1   $w  23.00
$tmer i17{e,p}/$f x -1 1   $w  9.83
$tmer i18{e,p}/$f x -1 1   $w  24.14
$tmer i19{e,p}/$f x -1 1   $w  18.04
$tmer i20{e,p}/$f x -1 1   $w  4.97
$tmer i21{e,p}/$f x -1 1   $w  11.90
$tmer i22{e,p}/$f x  1 -1   $w  0.14
$tmer i23{e,p}/$f x -1 1   $w  24.61
$tmer i24{e,p}/$f x -1 1   $w  15.40
##DLPNO-CCSD(T)   TightPNO  CBS(def2-TZVPP/def2-QZVPP)
###est. error: +/-0.2 [kcal/mol]
