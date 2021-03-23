if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer {ISO_E36,ISO_P36}/$f  x   1 -1    $w     -1.0  0 1 #  pyridon-hydroxypyridine   W1-F12
$tmer {c20cage,c20bowl}/$f  x  -1 1   $w     -7.7 0 1 # Manna and Martin, JPCA 120, 153-160, MP2/V{Q,5}Z+HLC/VTZ + geom. corr of 0.5 kcal (DLPNO-CCSD(T)/TightPNO/CBS(aug-cc-pTVZ/aug-cc-pVQZ))
$tmer {heptatriyne,heptahexaene}/$f  x 1 -1 $w -15.2 0 1 #  Schreiner/SchaeferIII example   W1-F12
$tmer {tmethen,omcb}/$f  x  -2 1   $w     -18.8 0 1 #  2 tetramethyletehen->ocatmethylcyclobutane CCSD(T)/CBS
$tmer {ISO_E35,ISO_P35}/$f  x   1 -1    $w     -22.9 0 1 #   Schreiner's isomerization 1-31    DLPNO-CCSD(T)/TightPNO/CBS(aug-cc-pTVZ/aug-cc-pVQZ)  
$tmer {carbooxo2,carbooxo1}/$f  x -1 1 $w     -25.7 0 1 #  strange isomerization  W1-F12
$tmer {ethen,ch2n2,13dip}/$f  x -1 -1 1 $w     -38.9 0 1 #  1,3-dipolar addition  W2-F12
$tmer {be4,be}/$f  x    1 -4           $w     -92.0 0 1 # W3.2                                    or -90.2 for W2-F12
$tmer {s2,s8}/$f  x -4  1               $w    -106.0 0 1 # W2-F12                                     
$tmer {ISO_C8H8_1,ISO_C8H8_41}/$f  x -1 1 $w 109.92 0 1 # Karton-Martin paper W1-F12
$tmer {o3,c2h2,o3_c2h2_add}/$f  x   -1 -1 1 $w -65.3 # W2-F12
$tmer {o3,c2h4,o3_c2h4_add}/$f  x   -1 -1 1 $w -58.7 # W2-F12
$tmer {C6Cl6,HCL,C6H6,CL2}/$f  x -1 -6 1 6 $w 152.6 # W1-F12 with TM 
