if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#new DLPNO-CCSD(T) TightPNO settings CBS(aug-cc-pVTZ/aug-cc-pVQZ)
#(estimated uncertainty: +/- 0.1 kcal/mol)
#tripeptides
$tmer {99,444}/$f  x -1 1  $w 0.02
$tmer {99,357}/$f  x -1 1  $w 1.01
$tmer {99,366}/$f  x -1 1  $w 0.70
$tmer {99,215}/$f  x -1 1  $w 0.85
$tmer {99,300}/$f  x -1 1  $w 0.78
$tmer {99,114}/$f  x -1 1  $w 1.92
$tmer {99,412}/$f  x -1 1  $w 2.18
$tmer {99,691}/$f  x -1 1  $w 1.61
$tmer {99,470}/$f  x -1 1  $w 1.89
$tmer {99,224}/$f  x -1 1  $w 2.07
#Tetrapeptides
# structures from PCCP2013 Goerigk, Amir, Martin, Radom; Ref. values same as above:
#GLY
$tmer GLY_{ab,aR}/$f  x -1 1 $w 1.07  
$tmer GLY_{ab,pII}/$f x -1 1 $w 1.23   
$tmer GLY_{ab,aL}/$f  x -1 1 $w 2.44 
$tmer GLY_{ab,b}/$f   x -1 1 $w 2.14  
# SER
$tmer SER_{ab,aR}/$f  x -1 1 $w 1.47
$tmer SER_{ab,pII}/$f x -1 1 $w 2.80 
$tmer SER_{ab,aL}/$f  x -1 1 $w 2.27
$tmer SER_{ab,b}/$f   x -1 1 $w 2.74
