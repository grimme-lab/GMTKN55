if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#strucs from Truhlar et al JCTC 2012, 8, 2824
#new W2-F12 reference values
$tmer  {f2s-cbh22,f2s,cbh22}/$f    x  -1  1  1  $w  57.17
$tmer  {f2s-ch2,f2s,ch2}/$f        x  -1  1  1  $w  91.14
$tmer  {h2s-cbh22,h2s,cbh22}/$f    x  -1  1  1  $w  20.96
$tmer  {h2s-ch2,h2s,ch2}/$f        x  -1  1  1  $w  36.40
$tmer  {me2s-cbh22,me2s,cbh22}/$f  x  -1  1  1  $w  38.99
$tmer  {me2s-ch2,me2s,ch2}/$f      x  -1  1  1  $w  51.74
$tmer  {nf3-cbh22,nf3,cbh22}/$f    x  -1  1  1  $w  12.31
$tmer  {nf3-ch2,nf3,ch2}/$f        x  -1  1  1  $w  53.73
$tmer  {nh3-cbh22,nh3,cbh22}/$f    x  -1  1  1  $w  32.58
$tmer  {nh3-ch2,nh3,ch2}/$f        x  -1  1  1  $w  28.87
$tmer  {nme3-cbh22,nme3,cbh22}/$f  x  -1  1  1  $w  42.11
$tmer  {nme3-ch2,nme3,ch2}/$f      x  -1  1  1  $w  42.81
$tmer  {pf3-cbh22,pf3,cbh22}/$f    x  -1  1  1  $w  52.28
$tmer  {pf3-ch2,pf3,ch2}/$f        x  -1  1  1  $w  76.37
$tmer  {ph3-cbh22,ph3,cbh22}/$f    x  -1  1  1  $w  44.80
$tmer  {ph3-ch2,ph3,ch2}/$f        x  -1  1  1  $w  60.11
$tmer  {pme3-cbh22,pme3,cbh22}/$f  x  -1  1  1  $w  66.59
$tmer  {pme3-ch2,pme3,ch2}/$f      x  -1  1  1  $w  78.00
