if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer  h/$f  n2o/$f  n2ohts/$f  x  -1  -1  1  $w  17.7
$tmer  oh/$f  n2/$f  n2ohts/$f  x  -1  -1  1  $w  82.6
$tmer  h/$f  hf/$f  hfhts/$f  x  -1  -1  1  $w  42.1
$tmer  hf/$f  h/$f  hfhts/$f  x  -1  -1  1  $w  42.1
$tmer  h/$f  hcl/$f  hclhts/$f  x  -1  -1  1  $w  17.8
$tmer  hcl/$f  h/$f  hclhts/$f  x  -1  -1  1  $w  17.8
$tmer  h/$f  ch3f/$f  hfch3ts/$f  x  -1  -1  1  $w  30.5
$tmer  hf/$f  ch3/$f  hfch3ts/$f  x  -1  -1  1  $w  56.9
$tmer  h/$f  f2/$f  hf2ts/$f  x  -1  -1  1  $w  1.5
$tmer  hf/$f  f/$f  hf2ts/$f  x  -1  -1  1  $w  104.8
$tmer  ch3/$f  clf/$f  ch3fclts/$f  x  -1  -1  1  $w  7.1
$tmer  ch3f/$f  cl/$f  ch3fclts/$f  x  -1  -1  1  $w  59.8
$tmer  f-/$f  ch3f/$f  fch3fts/$f    x  -1  -1  1  $w  -0.6
$tmer  ch3f/$f  f-/$f  fch3fts/$f    x  -1  -1  1  $w  -0.6
$tmer  fch3fcomp/$f  fch3fts/$f    x  -1  1    $w  13.4
$tmer  fch3fcomp/$f  fch3fts/$f    x  -1  1    $w  13.4
$tmer  cl-/$f  ch3cl/$f  clch3clts/$f x  -1  -1  1  $w  2.5
$tmer  ch3cl/$f  cl-/$f  clch3clts/$f x  -1  -1  1  $w  2.5
$tmer  clch3clcomp/$f  clch3clts/$f x  -1  1    $w  13.5
$tmer  clch3clcomp/$f  clch3clts/$f x  -1  1    $w  13.5
$tmer  f-/$f  ch3cl/$f  fch3clts/$f x  -1  -1  1  $w  -12.3
$tmer  cl-/$f  ch3f/$f  fch3clts/$f x  -1  -1  1  $w  19.8
$tmer  fch3clcomp1/$f  fch3clts/$f x  -1  1    $w  3.5
$tmer  fch3clcomp2/$f  fch3clts/$f x  -1  1    $w  29.6
$tmer  oh-/$f  ch3f/$f  hoch3fts/$f x  -1  -1  1  $w  -2.7
$tmer  ch3oh/$f  f-/$f  hoch3fts/$f x  -1  -1  1  $w  17.6
$tmer  hoch3fcomp2/$f  hoch3fts/$f x  -1  1    $w  11.0
$tmer  hoch3fcomp1/$f  hoch3fts/$f x  -1  1    $w  47.7
$tmer  h/$f  n2/$f  hn2ts/$f   x  -1  -1  1  $w  14.6
$tmer  hn2/$f  hn2ts/$f    x  -1  1    $w  10.9
$tmer  h/$f  co/$f  hcots/$f  x  -1  -1  1  $w  3.2
$tmer  hco/$f  hcots/$f    x  -1  1    $w  22.8
$tmer  h/$f  c2h4/$f  c2h5ts/$f  x  -1  -1  1  $w  2.0
$tmer  c2h5_1/$f  c2h5ts/$f    x  -1  1    $w  42.0
$tmer  ch3/$f  c2h4/$f  c3h7ts/$f  x  -1  -1  1  $w  6.4
$tmer  c3h7/$f  c3h7ts/$f    x  -1  1    $w  33.0
$tmer  hcn/$f  hcnts/$f    x  -1  1    $w  48.1
$tmer  hnc/$f  hcnts/$f    x  -1  1    $w  33.0
$tmer  h/$f  hcl/$f  RKT01/$f  x  -1  -1  1  $w  6.1
$tmer  H2/$f  cl/$f  RKT01/$f  x  -1  -1  1  $w  8.0
$tmer  oh/$f  H2/$f  RKT02/$f  x  -1  -1  1  $w  5.2
$tmer  H2O/$f  h/$f  RKT02/$f  x  -1  -1  1  $w  21.6
$tmer  ch3/$f  H2/$f  RKT03/$f  x  -1  -1  1  $w  11.9
$tmer  CH4/$f  h/$f  RKT03/$f  x  -1  -1  1  $w  15.0
$tmer  oh/$f  CH4/$f  RKT04/$f  x  -1  -1  1  $w  6.3
$tmer  H2O/$f  ch3/$f  RKT04/$f  x  -1  -1  1  $w  19.5
$tmer  h/$f  H2/$f  RKT06/$f  x  -1  -1  1  $w  9.7
$tmer  h/$f  H2/$f  RKT06/$f  x  -1  -1  1  $w  9.7
$tmer  oh/$f  NH3/$f  RKT07/$f  x  -1  -1  1  $w  3.4
$tmer  H2O/$f  NH2/$f  RKT07/$f  x  -1  -1  1  $w  13.7
$tmer  hcl/$f  ch3/$f  RKT08/$f  x  -1  -1  1  $w  1.8
$tmer  cl/$f  CH4/$f  RKT08/$f  x  -1  -1  1  $w  6.8
$tmer  oh/$f  C2H6/$f  RKT09/$f  x  -1  -1  1  $w  3.5
$tmer  H2O/$f  C2H5_2/$f  RKT09/$f  x  -1  -1  1  $w  20.4
$tmer  f/$f  H2/$f  RKT10/$f  x  -1  -1  1  $w  1.6
$tmer  hf/$f  h/$f  RKT10/$f  x  -1  -1  1  $w  33.8
$tmer  O/$f  CH4/$f  RKT11/$f  x  -1  -1  1  $w  14.4
$tmer  oh/$f  ch3/$f  RKT11/$f  x  -1  -1  1  $w  8.9
$tmer  h/$f  PH3/$f  RKT12/$f  x  -1  -1  1  $w  2.9
$tmer  H2/$f  PH2/$f  RKT12/$f  x  -1  -1  1  $w  24.7
$tmer  h/$f  oh/$f  RKT14/$f  x  -1  -1  1  $w  10.9
$tmer  H2/$f  O/$f  RKT14/$f  x  -1  -1  1  $w  13.2
$tmer  h/$f  H2S/$f  RKT16/$f  x  -1  -1  1  $w  3.9
$tmer  H2/$f  HS/$f  RKT16/$f  x  -1  -1  1  $w  17.2
$tmer  O/$f  hcl/$f  RKT17/$f  x  -1  -1  1  $w  10.4
$tmer  oh/$f  cl/$f  RKT17/$f  x  -1  -1  1  $w  9.9
$tmer  NH2/$f  ch3/$f  RKT18/$f  x  -1  -1  1  $w  8.9
$tmer  NH/$f  CH4/$f  RKT18/$f  x  -1  -1  1  $w  22.0
$tmer  NH2/$f  C2H5_2/$f  RKT19/$f  x  -1  -1  1  $w  9.8
$tmer  NH/$f  C2H6/$f  RKT19/$f  x  -1  -1  1  $w  19.4
$tmer  C2H6/$f  NH2/$f  RKT20/$f  x  -1  -1  1  $w  11.3
$tmer  C2H5_2/$f  NH3/$f  RKT20/$f  x  -1  -1  1  $w  17.8
$tmer  NH2/$f  CH4/$f  RKT21/$f  x  -1  -1  1  $w  13.9
$tmer  NH3/$f  ch3/$f  RKT21/$f  x  -1  -1  1  $w  16.9
$tmer  C5H8/$f  RKT22/$f    x  -1  1    $w  39.7
$tmer  C5H8/$f  RKT22/$f    x  -1  1    $w  39.7
