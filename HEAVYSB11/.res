if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer {geh3,ge2h6}/$f    x  2 -1 $w 73.82
$tmer {snme3,sn2me6}/$f  x  2 -1 $w 61.74 
$tmer {pbme3,pb2me6}/$f  x  2 -1 $w 52.92 
$tmer {sh,h2s2}/$f       x  2 -1 $w 67.85
$tmer {seh,h2se2}/$f     x  2 -1 $w 58.37
$tmer {teme,te2me2}/$f   x  2 -1 $w 52.91
$tmer {pme2,p2me4}/$f    x  2 -1 $w 61.85
$tmer {asme2,as2me4}/$f  x  2 -1 $w 52.18 
$tmer {sbme2,sb2me4}/$f  x  2 -1 $w 43.79
$tmer {cl,cl2}/$f        x  2 -1 $w 59.65
$tmer {br,br2}/$f        x  2 -1 $w 53.17
#PBE0-D3/def2-TZVP opt
##CCSD(T)/CBS(aug-cc-p(wC)VTZ(-PP)-aug-cc-p(wC)VQZ(-PP)) no diff funcs for snme3 and pbme3 rnxs (2 and 3)
