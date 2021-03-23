if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#nonrelativistic W1-F12 reference energies. 
##Extrapolation exponent for the CCSDF12CORR=3.38 for reactions containing H and 2nd row atoms only.
##Extrapolation exponent for the CCSDF12CORR=3.67 for reactions containing 3rd row atoms (thiol-thion here).
##SCS-MP2/def2-QZVP (cos=1.1, css=2/3) optimized geometries
#
##keto-enol
$tmer 1{a,b}/$f  x  -1 1             $w 4.30
$tmer 2{a,b}/$f  x  -1 1             $w 6.56
#
##beta imine ketone
$tmer 3{a,b}/$f  x  -1 1             $w -5.44
$tmer 3{a,c}/$f  x  -1 1             $w 5.25
$tmer 3{a,d}/$f  x  -1 1             $w 13.03
#
##heterocycles (nucleobases)
$tmer 4{a,b}/$f  x  -1 1             $w 0.93
$tmer 5{a,b}/$f  x  -1 1             $w 0.74
$tmer 5{a,c}/$f  x  -1 1             $w 1.45
$tmer 6{a,b}/$f  x  -1 1             $w -0.17
$tmer 6{a,c}/$f  x  -1 1             $w -0.87
$tmer 6{a,d}/$f  x  -1 1             $w 2.85
#
##N-heterocycles 
$tmer 7{a,b}/$f  x  -1 1             $w 2.15
$tmer 8{a,b}/$f  x  -1 1             $w 0.55
#
##thiol-thion
$tmer 9{a,b}/$f  x  -1 1             $w 0.95
$tmer 10{a,b}/$f  x  -1 1           $w -0.45
#
