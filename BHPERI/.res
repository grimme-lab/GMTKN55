if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#peri
$tmer Cyclobutene/$f        TS1/$f  x               -1  1   $w 35.3 
$tmer cis-135-Hexatriene/$f     TS2/$f x          -1  1   $w 30.8
$tmer ortho-xylylene/$f    TS3/$f         x         -1  1   $w 28.1 
$tmer 13-Pentadiene/$f     TS4/$f         x        -1  1   $w 39.7     
$tmer 13-Cyclopentadiene/$f TS5/$f x               -1  1   $w 28.3 
$tmer 15-Hexadiene/$f TS6/$f x                     -1  1   $w 35.8 
$tmer 13-Butadiene/$f Ethylene/$f TS7/$f x            -1 -1 1 $w 22.3     
$tmer 13-Cyclopentadiene/$f Ethylene/$f  TS8/$f x     -1 -1 1 $w 18.0 
$tmer 13-Cyclopentadiene/$f  TS11/$f x              -2  1  $w 14.5 
$tmer Cis-triscyclopropacyclohexane/$f  TS9/$f x     -1  1  $w 26.4 
#13dipolar
$tmer 13r_1/$f 13_c2h4/$f 13ts_1a/$f x               -1 -1  1 $w   27.6 
$tmer 13r_2/$f 13_c2h4/$f 13ts_2a/$f x               -1 -1  1 $w   20.0 
$tmer 13r_3/$f 13_c2h4/$f 13ts_3a/$f x               -1 -1  1 $w   13.8 
$tmer 13r_4/$f 13_c2h4/$f 13ts_4a/$f x               -1 -1  1 $w   11.8 
$tmer 13r_5/$f 13_c2h4/$f 13ts_5a/$f x               -1 -1  1 $w    6.5 
$tmer 13r_6/$f 13_c2h4/$f 13ts_6a/$f x               -1 -1  1 $w    4.7 
$tmer 13r_7/$f 13_c2h4/$f 13ts_7a/$f x               -1 -1  1 $w   13.1 
$tmer 13r_8/$f 13_c2h4/$f 13ts_8a/$f x               -1 -1  1 $w    5.9 
$tmer 13r_9/$f 13_c2h4/$f 13ts_9a/$f x               -1 -1  1 $w    0.5 
# DA barriers of butadiene and cyclic five-membered dienes with ethylene
$tmer 02r/$f 00r/$f 02ts/$f x -1 -1 1  $w 18.1  # 1,3-cyclopentadiene + ethylene 
$tmer 03r/$f 00r/$f 03ts/$f x -1 -1 1  $w 16.6  # cyc-c4h4sih2 + ethylene 
$tmer 04r/$f 00r/$f 04ts/$f x -1 -1 1  $w 22.9  # furan + ethylene 
$tmer 05r/$f 00r/$f 06ts/$f x -1 -1 1  $w 27.8  # pyrrole + ethylene 
$tmer 07r/$f 00r/$f 07ts/$f x -1 -1 1  $w 21.3  # c4h4ph + ethylene 
$tmer 07r/$f 00r/$f 08ts/$f x -1 -1 1  $w 21.6  # c4h4ph + ethylene 
$tmer 09r/$f 00r/$f 09ts/$f x -1 -1 1  $w 31.3  # thiophene + ethylene 
#new barriers from Karton-Goerigk paper, JCC, 2015, 36, 622. All references are based on W1-F12 or W2-F12
