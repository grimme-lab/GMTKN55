if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer i1{e,p}/$f  x -1 1   $w  71.53
$tmer i2{e,p}/$f  x -1 1   $w  38.13
$tmer i3{e,p}/$f  x -1 1   $w  10.29
$tmer i4{e,p}/$f  x -1 1   $w  69.03
$tmer i5{e,p}/$f  x -1 1   $w  32.85
$tmer i6{e,p}/$f  x -1 1   $w  24.14
$tmer i7{e,p}/$f  x -1 1   $w  17.72
$tmer i8{e,p}/$f  x -1 1   $w  23.93
$tmer i9{e,p}/$f  x -1 1   $w  21.10
$tmer i10{e,p}/$f x -1 1   $w  6.26

$tmer i12{e,p}/$f x -1 1   $w  0.42
$tmer i13{e,p}/$f x -1 1   $w  33.20
$tmer i14{e,p}/$f x -1 1   $w  4.92
$tmer i15{e,p}/$f x -1 1   $w  4.07
$tmer i16{e,p}/$f x -1 1   $w  22.62
$tmer i17{e,p}/$f x -1 1   $w  9.59
$tmer i18{e,p}/$f x -1 1   $w  23.77
$tmer i19{e,p}/$f x -1 1   $w  18.28
$tmer i20{e,p}/$f x -1 1   $w  5.13
$tmer i21{e,p}/$f x -1 1   $w  11.38
$tmer i22{e,p}/$f x  1 -1   $w  1.08
$tmer i23{e,p}/$f x -1 1   $w  23.66
$tmer i24{e,p}/$f x -1 1   $w  15.25
##DLPNO-CCSD(T)   TightPNO  CBS(def2-TZVPP/def2-QZVPP)
###est. error: +/-0.2 [kcal/mol]

## The i11 entry was removed because structure i11p showed significant spin contamination.
