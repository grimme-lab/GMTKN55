if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer li8/$f li2/$f                x -1 4         $w 86.47
$tmer na8/$f na2/$f                x -1 4         $w 53.15
$tmer li4_me4/$f li_me/$f          x -1 4         $w 131.13
$tmer li3_me/$f li_me/$f li2/$f       x -1 1 1       $w 34.51
$tmer li2_ch4/$f li_me/$f li_h/$f     x -1 1 1       $w 47.42
$tmer li5_ch/$f li4_c/$f li_h/$f      x -1 1 1       $w 66.28
$tmer li2_ch2n_2/$f li_ch2n/$f      x -1 2        $w 56.55
$tmer na+/$f li_na_h2/$f li+/$f na2_h2/$f x -1 -1 1 1   $w 25.30
##PBEH-3c optimized geometries
##Reference energies: CCSD(T)/CBS (aug-cc-pwCVTZ/QZ)
