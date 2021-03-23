if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

# SG/AH 12/2016
# # CCSD(T)/CBS(def2-TZVPP,def2-QZVPP Helgaker/Halkier extrapol.) reference values
# # PBEh-3c opt. based on xTB search
$tmer A{0,1}/$f  x -1 1 $w 1.61
$tmer A{0,2}/$f  x -1 1 $w 8.50
$tmer T{1,0}/$f  x -1 1 $w 2.94
$tmer T{1,2}/$f  x -1 1 $w 6.22
$tmer T{1,3}/$f  x -1 1 $w 7.19
$tmer arg{2,0}/$f  x -1 1 $w 2.38
$tmer his{1,2}/$f  x -1 1 $w 1.19
$tmer his{1,0}/$f  x -1 1 $w 0.79
$tmer his{1,3}/$f  x -1 1 $w 7.05
$tmer sugar{0,2}/$f  x -1 1 $w 2.98
$tmer sugar{0,4}/$f  x -1 1 $w 3.41
$tmer sugar{0,3}/$f  x -1 1 $w 3.21
$tmer aminocoohbz{2,1}/$f  x -1 1 $w 0.60
$tmer aminocoohbz{2,3}/$f  x -1 1 $w 7.21
$tmer h4p2o7{1,2}/$f  x -1 1 $w 2.36
$tmer h2s2o7{1,2}/$f  x -1 1 $w 17.88
$tmer s4o4{2,1}/$f  x -1 1 $w 11.20
$tmer c2h2f4{1,2}/$f  x -1 1 $w 1.27
$tmer c2cl4{3,2}/$f  x -1 1 $w 2.47
$tmer c2cl4{3,1}/$f  x -1 1 $w 2.15
