if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer {bih3_2,bih3}/$f         x -1 2  $w 1.16
$tmer {bih3_h2o,bih3,h2o}/$f   x -1 1 1 $w 2.49
$tmer {bih3_h2s,bih3,h2s}/$f   x -1 1 1 $w 1.36
$tmer {bih3_hcl,bih3,hcl}/$f   x -1 1 1 $w 0.77
$tmer {bih3_hbr,bih3,hbr}/$f   x -1 1 1 $w 0.98
$tmer {bih3_hi,bih3,hi}/$f     x -1 1 1 $w 1.30
$tmer {bih3_nh3,bih3,nh3}/$f   x -1 1 1 $w 0.60
$tmer {pbh4_2,pbh4}/$f         x -1 2 $w 1.25
$tmer {pbh4_bih3,pbh4,bih3}/$f x -1 1 1 $w 0.55
$tmer {pbh4_h2o,pbh4,h2o}/$f   x -1 1 1 $w 0.36
$tmer {pbh4_hcl,pbh4,hcl}/$f   x -1 1 1 $w 0.75
$tmer {pbh4_hbr,pbh4,hbr}/$f   x -1 1 1 $w 0.93
$tmer {pbh4_hi,pbh4,hi}/$f     x -1 1 1 $w 1.18
$tmer {pbh4_teh2,pbh4,teh2}/$f x -1 1 1 $w 0.65
$tmer {sbh3_2,sbh3}/$f         x -1 2  $w 1.28
$tmer {sbh3_h2o,sbh3,h2o}/$f   x -1 1 1 $w 1.57
$tmer {sbh3_h2s,sbh3,h2s}/$f   x -1 1 1 $w 1.06
$tmer {sbh3_hcl,sbh3,hcl}/$f   x -1 1 1 $w 2.02
$tmer {sbh3_hbr,sbh3,hbr}/$f   x -1 1 1 $w 1.89
$tmer {sbh3_hi,sbh3,hi}/$f     x -1 1 1 $w 1.49
$tmer {sbh3_nh3,sbh3,nh3}/$f   x -1 1 1 $w 2.84
$tmer {teh2_2,teh2}/$f         x -1 2  $w 0.52
$tmer {teh2_h2o,teh2,h2o}/$f   x -1 1 1 $w 0.68
$tmer {teh2_h2s,teh2,h2s}/$f   x -1 1 1 $w 0.48
$tmer {teh2_hcl,teh2,hcl}/$f   x -1 1 1 $w 1.23
$tmer {teh2_hbr,teh2,hbr}/$f   x -1 1 1 $w 1.22
$tmer {teh2_hi,teh2,hi}/$f     x -1 1 1 $w 0.80
$tmer {teh2_nh3,teh2,nh3}/$f   x -1 1 1 $w 3.35
#new reference values
##CCSD(T)/CBS(aug-cc-p(wC)VTZ(-PP)-aug-cc-p(wC)VQZ(-PP)
