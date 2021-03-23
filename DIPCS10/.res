if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer c4h4{,_2+}/$f  x -1 1 $w    529.2
$tmer c2h6{,_2+}/$f  x -1 1 $w    667.1
$tmer c2h4{,_2+}/$f  x -1 1 $w    655.8
$tmer n2h2{,_2+}/$f  x -1 1 $w    626.9
$tmer nh3{,_2+}/$f   x -1 1 $w    776.5
$tmer ch2o{,_2+}/$f  x -1 1 $w    747.6
$tmer h2s{,_2+}/$f   x -1 1 $w    733.0
$tmer ph3{,_2+}/$f   x -1 1 $w    649.6
$tmer mg{,_2+}/$f    x -1 1 $w    522.1
$tmer be{,_2+}/$f    x -1 1 $w    634.8
# W1-F12 // TPSS-D3/def2-TZVP
# # except Mg und Be, CCSD(T)/cc-pVC5Z/AE
