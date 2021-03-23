if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer c2h6/$f   h1/$f ch4/$f x  5 -1  -4 $w   9.54 0 1
$tmer c2h6/$f   h2/$f ch4/$f x  5 -1  -4 $w   9.50 0 1
$tmer c2h6/$f   h3/$f ch4/$f x  5 -1  -4 $w  11.09 0 1
$tmer c2h6/$f   h4/$f ch4/$f x  5 -1  -4 $w   8.85 0 1
$tmer c2h6/$f   h5/$f ch4/$f x  5 -1  -4 $w   8.64 0 1
$tmer c2h6/$f   h6/$f ch4/$f x  6 -1  -5 $w  10.81 0 1
$tmer c2h6/$f   h7/$f ch4/$f x  6 -1  -5 $w  12.74 0 1
$tmer c2h6/$f   h8/$f ch4/$f x  6 -1  -5 $w  11.70 0 1
$tmer c2h6/$f   h9/$f ch4/$f x  6 -1  -5 $w  13.20 0 1
$tmer c2h6/$f  h10/$f ch4/$f x  6 -1  -5 $w  11.07 0 1
$tmer c2h6/$f  h11/$f ch4/$f x  6 -1  -5 $w  12.49 0 1
$tmer c2h6/$f  h12/$f ch4/$f x  6 -1  -5 $w  12.35 0 1
$tmer c2h6/$f  h13/$f ch4/$f x  6 -1  -5 $w  10.99 0 1
$tmer c2h6/$f  h14/$f ch4/$f x  6 -1  -5 $w   9.83 0 1
$tmer c2h6/$f  h15/$f ch4/$f x  7 -1  -6 $w  14.27 0 1
$tmer c2h6/$f   r1/$f ch4/$f x  5 -1  -5 $w   2.24 0 1
$tmer c2h6/$f   r2/$f ch4/$f x  6 -1  -6 $w  10.56 0 1
$tmer c2h6/$f   r3/$f ch4/$f x  6 -1  -6 $w   6.11 0 1
$tmer c2h6/$f   r4/$f ch4/$f x  7 -1  -7 $w  14.67 0 1
$tmer c2h6/$f   r5/$f ch4/$f x  7 -1  -7 $w  10.21 0 1
$tmer c2h6/$f   r6/$f ch4/$f x  7 -1  -7 $w   9.78 0 1
$tmer c2h6/$f   r7/$f ch4/$f x  7 -1  -7 $w   8.72 0 1
$tmer c2h6/$f   r8/$f ch4/$f x  7 -1  -7 $w  10.10 0 1
$tmer c2h6/$f   r9/$f ch4/$f x  7 -1  -7 $w   9.47 0 1
$tmer c2h6/$f  r10/$f ch4/$f x 11 -1 -12 $w  18.55 0 1
$tmer c2h6/$f  r11/$f ch4/$f x 11 -1 -12 $w   8.93 0 1
$tmer c2h6/$f  r12/$f ch4/$f x 11 -1 -12 $w  14.56 0 1
$tmer c2h6/$f  r13/$f ch4/$f x 11 -1 -12 $w  25.52 0 1
$tmer c2h6/$f  r14/$f ch4/$f x 11 -1 -12 $w  22.86 0 1
$tmer c2h6/$f  r15/$f ch4/$f x 13 -1 -14 $w  27.25 0 1
$tmer c2h6/$f  r16/$f ch4/$f x 12 -1 -12 $w  24.96 0 1
$tmer c2h6/$f   c1/$f ch4/$f x 12 -1 -14 $w  26.82 0 1
$tmer c2h6/$f   c2/$f ch4/$f x 14 -1 -16 $w  38.34 0 1
$tmer c2h6/$f   c3/$f ch4/$f x 14 -1 -16 $w  31.09 0 1
$tmer c2h6/$f   c4/$f ch4/$f x 16 -1 -18 $w  49.82 0 1
$tmer c2h6/$f   c5/$f ch4/$f x 18 -1 -22 $w  45.46 0 1
#new reference values for BSR36
##DLPNO-CCSD(T)   TightPNO   CBS(aug-cc-pVTZ/aug-cc-pVQZ)
##est. error: +/-0.1 [kcal/mol]
