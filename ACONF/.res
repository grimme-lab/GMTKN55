if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer B_{T,G}/$f      x   -1 1   $w 0.598
$tmer P_{TT,TG}/$f    x   -1 1   $w 0.614
$tmer P_{TT,GG}/$f    x   -1 1   $w 0.961
$tmer P_{TT,GX}/$f    x   -1 1   $w 2.813
$tmer H_{ttt,gtt}/$f  x   -1 1   $w 0.595
$tmer H_{ttt,tgt}/$f  x   -1 1   $w 0.604
$tmer H_{ttt,tgg}/$f  x   -1 1   $w 0.934
$tmer H_{ttt,gtg}/$f  x   -1 1   $w 1.178
$tmer H_{ttt,g+t+g-}/$f x -1 1   $w 1.302
$tmer H_{ttt,ggg}/$f    x -1 1   $w 1.250
$tmer H_{ttt,g+x-t+}/$f x -1 1   $w 2.632
$tmer H_{ttt,t+g+x-}/$f x -1 1   $w 2.740 
$tmer H_{ttt,g+x-g-}/$f x -1 1   $w 3.283 
$tmer H_{ttt,x+g-g-}/$f x -1 1   $w 3.083 
$tmer H_{ttt,x+g-x+}/$f x -1 1   $w 4.925 
