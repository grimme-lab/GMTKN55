if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer 1O{,_A,_B}/$f  x -1 1 1 $w      5.370 
$tmer 2O{,_A,_B}/$f  x -1 1 1 $w      6.047 
$tmer 3O{,_A,_B}/$f  x -1 1 1 $w      2.421 
$tmer 4O{,_A,_B}/$f  x -1 1 1 $w      9.967 
$tmer 1N{,_A,_B}/$f  x -1 1 1 $w      2.357 
$tmer 2N{,_A,_B}/$f  x -1 1 1 $w      3.021 
$tmer 3N{,_A,_B}/$f  x -1 1 1 $w      1.205 
$tmer 4N{,_A,_B}/$f  x -1 1 1 $w      4.177 
$tmer 1CL{,_A,_B}/$f x -1 1 1 $w      7.839 
$tmer 2CL{,_A,_B}/$f x -1 1 1 $w     10.483 
$tmer 3CL{,_A,_B}/$f x -1 1 1 $w      3.241 
$tmer 4CL{,_A,_B}/$f x -1 1 1 $w     16.296
# SG/AH 01/2017
# # PBEh-3c opt carbene (1), CClMe (2), SiH2 (3), NHC (4) singlet ... H2O, NH3, HCl complexes
# # 4CL is an intermediate step of the optimization because the minimum corresponds
# # to a full HCl-NHC proton transfer
# # W2-F12 reference values (w/o CP correction and geometry relaxation) in kcal/mol
