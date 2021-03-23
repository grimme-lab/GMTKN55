if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer 008{,A,B}/$f  x 1 -1 -1 $w -100.41
$tmer 144{,A,B}/$f  x 1 -1 -1 $w -120.80
$tmer 147{,A,B}/$f  x 1 -1 -1 $w -116.91
$tmer 148{,A,B}/$f  x 1 -1 -1 $w -105.01
$tmer 150{,A,B}/$f  x 1 -1 -1 $w -104.44
$tmer 152{,A,B}/$f  x 1 -1 -1 $w -87.42
$tmer 187{,A,B}/$f  x 1 -1 -1 $w -114.00
$tmer 202{,A,B}/$f  x 1 -1 -1 $w -113.51
$tmer 212{,A,B}/$f  x 1 -1 -1 $w -114.91
$tmer 213{,A,B}/$f  x 1 -1 -1 $w -112.75
$tmer 214{,A,B}/$f  x 1 -1 -1 $w -104.47
$tmer 227{,A,B}/$f  x 1 -1 -1 $w -118.19
$tmer 228{,A,B}/$f  x 1 -1 -1 $w -112.02
$tmer 229{,A,B}/$f  x 1 -1 -1 $w -106.53
$tmer 230{,A,B}/$f  x 1 -1 -1 $w -110.98
$tmer 231{,A,B}/$f  x 1 -1 -1 $w -102.37
#CCSD(T)/CBS reference values from JCTC 2015, 11, 2473. The three benzene/alkali+ complexes are based on est. CCSD(T)/CBS
