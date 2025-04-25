if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

# new W2-F12 (A. Karton, private commun.)
$tmer {nh3,bh3_1,nh3-bh3}/$f     x -1 -1 1 $w  -32.1      # NH3+BH3->NH3-BH3
$tmer {nh3-bh3,nh2-bh2,h2_1}/$f  x -1  1 1 $w   -0.2      # NH3-BH3->NH2=BH2+H2
$tmer {nh2-bh2,nh-bh,h2_1}/$f    x -1  1 1 $w   37.6      # NH2-BH2->NHBH+H2
$tmer {nh2-bh2,cbut}/$f        x -2  1   $w  -19.5      # 2NH2-BH2->(NH2-BH2)_2 (4Ring)
$tmer {nh2-bh2,bz,h2_1}/$f       x -3  1 3 $w  -48.9      # 3NH2-BH2->borazine+3H2
$tmer {nh2-bh2,ch}/$f          x -3  1   $w  -46.1      # 3NH2-BH2->(NH2-BH2)_3 (6Ring)
## est val. CCSD(T)/CBS(aTQ,TZ)//PBE0/TZVP +MP2/TZ core effect (pwC)
#new W2-F12 except last and third last which is W1-F12
$tmer {BH3PH3,BH3_2,PH3}/$f      x 1 -1 -1 $w  -25.2
$tmer {K_H,BH3PH3,H2_2}/$f       x 1 -1 -1 $w   40.4
$tmer {BF3PMe3,BF3,PMe3}/$f    x 1 -1 -1 $w  -15.2
$tmer {K_F,BF3PMe3,H2_2}/$f      x 1 -1 -1 $w  18.5
$tmer {BCl3PMe3,BCl3,PMe3}/$f  x 1 -1 -1 $w  -31.2
$tmer {K_Cl,BCl3PMe3,H2_2}/$f    x 1 -1 -1 $w  17.6
