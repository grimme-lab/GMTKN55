if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#polyenes from Zhao&Truhlar JPCA 110, 2006, 10481
#new W1-F12 (A. Karton, private commun.) 
$tmer p2{,p}/$f  x  1 -1  $w 167.2
$tmer p4{,p}/$f  x  1 -1  $w 192.9
$tmer p6{,p}/$f  x  1 -1  $w 209.2
$tmer p8{,p}/$f  x  1 -1  $w 219.2
#small molecules from Parthiban and Martin JCP 2001, 114, 6014.
#new W2-F12 (A. Karton, private commun.)
$tmer nh3{,p}/$f  x 1 -1   $w 211.9
$tmer h2o{,p}/$f  x 1 -1   $w 171.4
$tmer c2h2{,p}/$f  x 1 -1 $w 157.4
$tmer sih4{,p}/$f  x 1 -1 $w 156.9
$tmer ph3{,p}/$f  x 1 -1 $w 192.8
$tmer h2s{,p}/$f  x 1 -1 $w 174.3
$tmer hcl{,p}/$f  x 1 -1 $w 137.8
$tmer h2{,p}/$f  x 1 -1 $w 106.2
# S. Grimme 11/2016
# # PBEh-3c geom.
# # reference values: A. Hansen 12/2016
# # CCSD(T)/CBS(def2-TZVPP/def2-QZVPP)
# # proton affinities in kcal/mol
$tmer  c2f6{,p}/$f  x 1 -1 $w  120.8
$tmer  ethanol{,p}/$f  x 1 -1 $w  191.9
$tmer  ch3cooh{,p}/$f  x 1 -1 $w  190.9
$tmer  gly{,p}/$f  x 1 -1 $w  218.2
$tmer  phenol{,p}/$f  x 1 -1 $w  200.4
$tmer  ass{,p}/$f  x 1 -1 $w  210.2
$tmer  ch2s{,p}/$f  x 1 -1 $w  188.3
$tmer  si2h6{,p}/$f  x 1 -1 $w  181.9
$tmer  cys{,p}/$f  x 1 -1 $w  221.3
$tmer  phosphapyrrol{,p}/$f  x 1 -1 $w  219.6
$tmer   A{,p}/$f  x  1 -1 $w  192.9
$tmer   T{,p}/$f  x  1 -1 $w  210.7
$tmer   G{,p}/$f  x  1 -1 $w  236.0
$tmer   C{,p}/$f  x  1 -1 $w  235.1

