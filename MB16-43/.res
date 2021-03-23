if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer {01,H2,BH3,N2,O2,F2,NaH,AlH3,Cl2}/$f  x -2 -4 4 2 2 1 2 2 1 $w 869.5971
$tmer {02,H2,LiH,BH3,O2,F2,MgH2,SiH4,S2}/$f  x -2 -6 2 4 1 1 2 2 2 $w 737.7865
$tmer {03,H2,LiH,CH4,O2,F2,NaH,MgH2,AlH3,S2}/$f  x -2 -13 2 6 1 1 2 2 2 1 $w 518.6576
$tmer {04,H2,BH3,CH4,O2,F2,AlH3,SiH4}/$f  x -2 -17 6 2 1 1 2 4 $w 356.8481
$tmer {05,H2,BH3,N2,SiH4,P2,Cl2}/$f  x -2 -4 4 2 2 4 1 $w 147.6828
$tmer {06,H2,BH3,CH4,N2,O2,MgH2,AlH3}/$f  x -2 -10 6 2 1 1 2 2 $w 368.4941
$tmer {07,H2,BH3,CH4,N2,O2,F2,MgH2,S2,Cl2}/$f  x -2 -7 2 4 1 1 2 2 1 1 $w 557.9836
$tmer {08,H2,BeH2,BH3,CH4,O2,F2,AlH3}/$f  x -2 -17 2 6 4 2 2 2 $w 681.9598
$tmer {09,H2,LiH,BH3,CH4,F2,SiH4,Cl2}/$f  x -2 -6 2 4 2 1 2 1 $w 381.4301
$tmer {10,H2,BH3,CH4,N2,F2,MgH2,SiH4,Cl2}/$f  x -2 -14 2 6 1 1 2 2 1 $w 46.3073
$tmer {11,H2,BH3,CH4,N2,O2,F2,MgH2,AlH3}/$f  x -2 -12 4 4 1 1 1 2 2 $w 294.4058
$tmer {12,H2,BH3,CH4,N2,O2,F2,AlH3,P2,Cl2}/$f  x -2 -11 4 2 2 1 1 4 1 1 $w 453.0647
$tmer {13,H2,CH4,N2,O2,MgH2,S2}/$f  x -2 -5 4 4 2 2 2 $w 19.8751
$tmer {14,H2,LiH,BH3,O2,AlH3,SiH4,Cl2}/$f  x -2 -9 2 4 1 4 2 1 $w 384.8895
$tmer {15,H2,BH3,CH4,NaH,AlH3,SiH4,S2,Cl2}/$f  x -2 -15 4 2 2 2 4 1 1 $w 216.0961
$tmer {16,H2,LiH,BH3,O2,MgH2,AlH3,SiH4}/$f  x -2 -19 2 6 1 4 2 4 $w 326.7567
$tmer {17,H2,BH3,CH4,O2,F2,MgH2,SiH4}/$f  x -2 -9 4 2 1 3 2 2 $w 653.5931
$tmer {18,H2,BH3,N2,O2,F2,AlH3,Cl2}/$f  x -2 -4 6 1 1 1 2 1 $w 580.8610
$tmer {19,H2,LiH,BH3,O2,F2,AlH3,P2,S2}/$f  x -2 -7 2 4 1 1 4 2 1 $w 664.5600
$tmer {20,H2,BH3,CH4,N2,F2,P2}/$f  x -2 -11 6 4 2 2 1 $w 242.8055
$tmer {21,H2,BH3,O2,NaH,MgH2,AlH3,Cl2}/$f  x -2 -7 2 2 2 4 4 1 $w 806.2253
$tmer {22,H2,BH3,O2,F2,MgH2,P2}/$f  x -2 -3 6 2 1 2 1 $w 706.2037
$tmer {23,H2,BH3,CH4,F2,MgH2,SiH4,Cl2}/$f  x -2 -20 8 2 1 2 4 1 $w 215.3928
$tmer {24,H2,BH3,O2,F2,AlH3,SiH4,S2}/$f  x -2 -8 2 1 4 2 4 1 $w 1070.6395
$tmer {25,H2,BH3,O2,F2,AlH3,SiH4}/$f  x -1 -5 2 1 1 1 2 $w 322.4904
$tmer {26,H2,BH3,CH4,O2,MgH2,AlH3,SiH4,P2}/$f  x -2 -8 2 2 2 2 2 2 1 $w 373.6680
$tmer {27,H2,BH3,CH4,N2,O2,AlH3,S2,Cl2}/$f  x -2 -12 2 6 2 1 2 1 1 $w 114.9666
$tmer {28,BH3,N2,O2,F2,AlH3}/$f  x -2 4 2 1 1 2 $w 325.1213
$tmer {29,H2,LiH,BH3,CH4,N2,F2,SiH4,S2}/$f  x -2 -9 2 4 2 1 3 2 1 $w 695.1032
$tmer {30,H2,LiH,BH3,CH4,F2,AlH3,SiH4,S2}/$f  x -2 -12 4 2 2 5 2 2 1 $w 1290.7358
$tmer {31,H2,BH3,CH4,O2,F2,AlH3,P2,Cl2}/$f  x -2 -8 4 2 1 1 2 4 1 $w 534.9003
$tmer {32,H2,LiH,BH3,N2,F2,AlH3,SiH4,S2}/$f  x -2 -11 2 6 1 2 2 2 1 $w 685.5818
$tmer {33,H2,BH3,CH4,N2,F2,AlH3,S2}/$f  x -2 -6 4 2 2 1 2 2 $w 312.6925
$tmer {34,H2,BH3,CH4,N2,O2,F2,MgH2,AlH3,SiH4,P2}/$f  x -2 -10 2 2 1 2 1 2 2 2 1 $w 538.2642
$tmer {35,H2,LiH,BH3,CH4,O2,AlH3,SiH4,P2,Cl2}/$f  x -2 -20 2 4 4 1 4 2 1 1 $w 228.1748
$tmer {36,H2,LiH,CH4,N2,O2,F2,P2,Cl2}/$f  x -2 3 2 2 1 2 1 1 1 $w 552.8500
$tmer {37,H2,BH3,CH4,O2,F2,AlH3,SiH4,S2}/$f  x -2 -19 8 2 2 1 2 2 2 $w 629.7842
$tmer {38,H2,BH3,CH4,N2,F2,AlH3,SiH4,P2,S2}/$f  x -2 -12 2 2 2 1 2 4 1 1 $w 98.1943
$tmer {39,H2,LiH,BH3,CH4,F2,NaH,Cl2}/$f  x -2 -5 2 2 4 2 2 1 $w 436.4044
$tmer {40,H2,BH3,CH4,N2,AlH3,SiH4}/$f  x -2 -26 6 6 1 2 4 $w -362.9806
$tmer {41,H2,BH3,CH4,F2,NaH,AlH3,S2}/$f  x -2 -16 4 6 1 2 2 2 $w 160.2909
$tmer {42,H2,BH3,CH4,N2,O2,F2,AlH3,P2}/$f  x -2 -11 4 2 1 2 2 4 1 $w 754.6458
$tmer {43,H2,BH3,N2,O2,F2,AlH3,SiH4}/$f  x -2 -7 2 3 1 1 2 4 $w 421.9683
