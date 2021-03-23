if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer  {E1,P1}/$f    x  -1  1  $w  1.49
$tmer  {E1,P2}/$f    x  -1  1  $w  23.36
$tmer  {E3,P3}/$f    x  -1  1  $w  7.27
$tmer  {E4,P4}/$f    x  -1  1  $w  1.06
$tmer  {E5,E4}/$f    x  -1  1  $w  1.23
$tmer  {E4,P6}/$f    x  -1  1  $w  2.49
$tmer  {E7,P7}/$f    x  -1  1  $w  11.15
$tmer  {E8,P8}/$f    x  -1  1  $w  22.59
$tmer  {E9,P9}/$f    x  -1  1  $w  6.54
$tmer  {E10,P10}/$f  x  -1  1  $w  3.80
$tmer  {E11,P11}/$f  x  -1  1  $w  1.58
$tmer  {E12,P12}/$f  x  -1  1  $w  45.65
$tmer  {E13,P13}/$f  x  -1  1  $w  36.85
$tmer  {E14,P14}/$f  x  -1  1  $w  24.58
$tmer  {E15,P15}/$f  x  -1  1  $w  8.25
$tmer  {E16,P16}/$f  x  -1  1  $w  10.02
$tmer  {E17,P17}/$f  x  -1  1  $w  28.51
$tmer  {E18,P18}/$f  x  -1  1  $w  11.68
$tmer  {E19,E20}/$f  x  -1  1  $w  4.58
$tmer  {E20,P20}/$f  x  -1  1  $w  18.12
$tmer  {E21,P21}/$f  x  -1  1  $w  1.16
$tmer  {E22,E21}/$f  x  -1  1  $w  4.65
$tmer  {E23,P23}/$f  x  -1  1  $w  5.54
$tmer  {E24,P24}/$f  x  -1  1  $w  12.26
$tmer  {E25,P25}/$f  x  -1  1  $w  26.14
$tmer  {E26,P26}/$f  x  -1  1  $w  17.14
$tmer  {E27,P27}/$f  x  -1  1  $w  66.06
$tmer  {E28,P28}/$f  x  -1  1  $w  31.26
$tmer  {E29,P29}/$f  x  -1  1  $w  13.05
$tmer  {E30,P30}/$f  x  -1  1  $w  9.98
$tmer  {E31,P31}/$f  x  -1  1  $w  15.23
$tmer  {E32,P32}/$f  x  -1  1  $w  6.64
$tmer  {E33,P33}/$f  x  -1  1  $w  8.70
$tmer  {E34,P34}/$f  x  -1  1  $w  6.77
