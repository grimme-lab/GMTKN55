if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer {PCH_PhBr,PCH,PhBr}/$f  x -1 1 1 $w 0.85
$tmer {NCH_PhBr,NCH,PhBr}/$f  x -1 1 1 $w 1.15
$tmer {NH3_PhBr,NH3,PhBr}/$f  x -1 1 1 $w 2.02
$tmer {MeI_PCH,MeI,PCH}/$f  x -1 1 1 $w 0.85
$tmer {MeI_NCH,MeI,NCH}/$f  x -1 1 1 $w 1.42
$tmer {MeI_NH3,MeI,NH3}/$f  x -1 1 1 $w 2.73
$tmer {PCH_PhI,PCH,PhI}/$f  x -1 1 1 $w 0.92
$tmer {NCH_PhI,NCH,PhI}/$f  x -1 1 1 $w 1.87
$tmer {NH3_PhI,NH3,PhI}/$f  x -1 1 1 $w 3.33
$tmer {PCH_F3CI,PCH,F3CI}/$f  x -1 1 1 $w 0.89
$tmer {NCH_F3CI,NCH,F3CI}/$f  x -1 1 1 $w 3.61
$tmer {NH3_F3CI,NH3,F3CI}/$f  x -1 1 1 $w 5.88
$tmer {BrBr_PCH,BrBr,PCH}/$f  x -1 1 1 $w 1.18
$tmer {BrBr_NCH,BrBr,NCH}/$f  x -1 1 1 $w 3.61
$tmer {BrBr_NH3,BrBr,NH3}/$f  x -1 1 1 $w 7.29
$tmer {PCH_NBS,PCH,NBS}/$f  x -1 1 1 $w 1.19
$tmer {NCH_NBS,NCH,NBS}/$f  x -1 1 1 $w 4.32
$tmer {NH3_NBS,NH3,NBS}/$f  x -1 1 1 $w 8.02
$tmer {PCH_FCl,PCH,FCl}/$f  x -1 1 1 $w 1.16
$tmer {NCH_FCl,NCH,FCl}/$f  x -1 1 1 $w 4.81
$tmer {NH3_FCl,NH3,FCl}/$f  x -1 1 1 $w 10.54
$tmer {PCH_NIS,PCH,NIS}/$f  x -1 1 1 $w 1.53
$tmer {NCH_NIS,NCH,NIS}/$f  x -1 1 1 $w 5.91
$tmer {NH3_NIS,NH3,NIS}/$f  x -1 1 1 $w 10.99
$tmer {PCH_FBr,PCH,FBr}/$f  x -1 1 1 $w 2.07
$tmer {NCH_FBr,NCH,FBr}/$f  x -1 1 1 $w 7.53
$tmer {NH3_FBr,NH3,FBr}/$f  x -1 1 1 $w 15.30
$tmer {FI_PCH,FI,PCH}/$f  x -1 1 1 $w 2.74
$tmer {FI_NCH,FI,NCH}/$f  x -1 1 1 $w 9.33
$tmer {FI_NH3,FI,NH3}/$f  x -1 1 1 $w 17.11
$tmer {MeI_FCCH,MeI,FCCH}/$f  x -1 1 1 $w 0.50
$tmer {BrBr_FCCH,BrBr,FCCH}/$f  x -1 1 1 $w 0.74
$tmer {FI_FCCH,FI,FCCH}/$f  x -1 1 1 $w 0.29
$tmer {MeI_FMe,MeI,FMe}/$f  x -1 1 1 $w 1.70
$tmer {BrBr_FMe,BrBr,FMe}/$f  x -1 1 1 $w 2.87
$tmer {FI_FMe,FI,FMe}/$f  x -1 1 1 $w 5.97
$tmer {MeI_OCH2,MeI,OCH2}/$f  x -1 1 1 $w 2.39
$tmer {BrBr_OCH2,BrBr,OCH2}/$f  x -1 1 1 $w 4.41
$tmer {FI_OCH2,FI,OCH2}/$f  x -1 1 1 $w 9.94
$tmer {MeI_OPH3,MeI,OPH3}/$f  x -1 1 1 $w 3.34
$tmer {BrBr_OPH3,BrBr,OPH3}/$f  x -1 1 1 $w 5.95
$tmer {FI_OPH3,FI,OPH3}/$f  x -1 1 1 $w 13.36
$tmer {MeI_pyr,MeI,pyr}/$f  x -1 1 1 $w 3.61
$tmer {BrBr_pyr,BrBr,pyr}/$f  x -1 1 1 $w 9.07
$tmer {FI_pyr,FI,pyr}/$f  x -1 1 1 $w 20.34
#the above systems are from XB51 without the three PdCl2 and Li cases. Kozuch and Martin, JCTC 2013, 9, 1918.
##est. CCSD(T)/CBS
##values taken from SI because of errors in Table 5 in the MS.

#systems 11,12, 19-30 from Hobza's X40 set; Refs. est. CCSD(T)/CBS
$tmer 11_benF3-ben{A,B,AB}/$f  x 1 1 -1 $w 4.40
$tmer 12_benF6-ben{A,B,AB}/$f  x 1 1 -1 $w 6.12
$tmer 19_benCl-acetone{A,B,AB}/$f  x 1 1 -1 $w 1.49
$tmer 20_benBr-acetone{A,B,AB}/$f  x 1 1 -1 $w 2.43
$tmer 21_benI-acetone{A,B,AB}/$f  x 1 1 -1 $w 3.46
$tmer 22_benCl-Nm3{A,B,AB}/$f  x 1 1 -1 $w 2.11
$tmer 23_benBr-Nm3{A,B,AB}/$f  x 1 1 -1 $w 3.78
$tmer 24_benI-Nm3{A,B,AB}/$f  x 1 1 -1 $w 5.81
$tmer 25_benBr-mSH{A,B,AB}/$f  x 1 1 -1 $w 2.32
$tmer 26_benI-mSH{A,B,AB}/$f  x 1 1 -1 $w  3.08
$tmer 27_CH3Br-ben{A,B,AB}/$f  x 1 1 -1 $w 1.81
$tmer 28_CH3I-ben{A,B,AB}/$f  x 1 1 -1 $w  2.48
$tmer 29_CF3Br-ben{A,B,AB}/$f  x 1 1 -1 $w 3.11
$tmer 30_CF3I-ben{A,B,AB}/$f  x 1 1 -1 $w  3.91
