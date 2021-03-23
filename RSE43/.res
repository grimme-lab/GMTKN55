if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#new W1-F12 reference values
# get dE(CH4-CH3) for RSE calculation	
d0CH4=$( $tmer   {E,P}1/$f    x -1  1    $w $d0CH4 | awk '{ print $6; }' )

#echo $d0CH4

#~/bin/tmer/tmer2   {E,P}1    x -1   1    $w $d0CH4     0.0    # need for dE, not part of the set
$tmer   {E,P}2/$f   x -1   1    $w $d0CH4   -15.3    
$tmer   {E,P}3/$f   x -1   1    $w $d0CH4     2.0  
$tmer   {E,P}4/$f   x -1   1    $w $d0CH4     6.9  
$tmer   {E,P}5/$f   x -1   1    $w $d0CH4    -0.7  
$tmer   {E,P}6/$f   x -1   1    $w $d0CH4     0.1  
$tmer   {E,P}7/$f   x -1   1    $w $d0CH4     1.4  
$tmer   {E,P}8/$f   x -1   1    $w $d0CH4    -3.0  
$tmer   {E,P}9/$f   x -1   1    $w $d0CH4    -1.5  
$tmer   {E,P}10/$f  x -1   1    $w $d0CH4    -2.0  
$tmer   {E,P}11/$f  x -1   1    $w $d0CH4   -17.7  
$tmer   {E,P}12/$f  x -1   1    $w $d0CH4   -10.1  
$tmer   {E,P}13/$f  x -1   1    $w $d0CH4    -8.4  
$tmer   {E,P}15/$f  x -1   1    $w $d0CH4    -6.4  
$tmer   {E,P}16/$f  x -1   1    $w $d0CH4    -6.5  
$tmer   {E,P}17/$f  x -1   1    $w $d0CH4    -6.6  
$tmer   {E,P}18/$f  x -1   1    $w $d0CH4    -6.5  
$tmer   {E,P}19/$f  x -1   1    $w $d0CH4    -3.1  
$tmer   {E,P}20/$f  x -1   1    $w $d0CH4    -3.8  
$tmer   {E,P}21/$f  x -1   1    $w $d0CH4   -12.5  
$tmer   {E,P}22/$f  x -1   1    $w $d0CH4     4.7  
$tmer   {E,P}23/$f  x -1   1    $w $d0CH4   -13.1  
$tmer   {E,P}24/$f  x -1   1    $w $d0CH4   -11.2  
$tmer   {E,P}25/$f  x -1   1    $w $d0CH4    -8.9  
$tmer   {E,P}26/$f  x -1   1    $w $d0CH4   -13.3  
$tmer   {E,P}27/$f  x -1   1    $w $d0CH4    -3.5  
$tmer   {E,P}28/$f  x -1   1    $w $d0CH4    -3.8  
$tmer   {E,P}29/$f  x -1   1    $w $d0CH4    -2.9  
$tmer   {E,P}30/$f  x -1   1    $w $d0CH4    -6.0  
$tmer   {E,P}31/$f  x -1   1    $w $d0CH4    -6.4  
$tmer   {E,P}32/$f  x -1   1    $w $d0CH4    -4.3  
$tmer   {E,P}33/$f  x -1   1    $w $d0CH4     0.6  
$tmer   {E,P}34/$f  x -1   1    $w $d0CH4   -11.5  
$tmer   {E,P}35/$f  x -1   1    $w $d0CH4    -9.1  
$tmer   {E,P}36/$f  x -1   1    $w $d0CH4     2.4  
$tmer   {E,P}37/$f  x -1   1    $w $d0CH4    -10.1  
$tmer   {E,P}38/$f  x -1   1    $w $d0CH4    -0.4  
$tmer   {E,P}39/$f  x -1   1    $w $d0CH4    -3.5  
$tmer   {E,P}40/$f  x -1   1    $w $d0CH4   -23.1  
$tmer   {E,P}41/$f  x -1   1    $w $d0CH4   -25.1  
$tmer   {E,P}42/$f  x -1   1    $w $d0CH4   -26.4  
$tmer   {E,P}43/$f  x -1   1    $w $d0CH4   -13.1  
$tmer   {E,P}44/$f  x -1   1    $w $d0CH4    -6.7  
$tmer   {E,P}45/$f  x -1   1    $w $d0CH4    -2.3  
