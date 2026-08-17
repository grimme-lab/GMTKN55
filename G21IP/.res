if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

# G21IP revised W3 reference values
$tmer h/$f  x   -1   $w  314.900
$tmer {li+,li}/$f  x   1 -1 $w  124.214
$tmer {be+,be}/$f  x   1 -1 $w  214.855
$tmer {b+,b}/$f  x   1 -1 $w  191.497
$tmer {c+,c}/$f  x   1 -1 $w  259.713
$tmer {n+,n}/$f  x   1 -1 $w  335.587
$tmer {o+,o}/$f  x   1 -1 $w  314.027
$tmer {f+,f}/$f  x   1 -1 $w  402.151
$tmer {na+,na}/$f  x   1 -1 $w  118.131
$tmer {mg+,mg}/$f  x   1 -1 $w  175.806
$tmer {al+,al}/$f  x   1 -1 $w  137.846
$tmer {si+,si}/$f  x   1 -1 $w  188.211
$tmer {p+,p}/$f  x   1 -1 $w  242.850
$tmer {s+,s}/$f  x   1 -1 $w  238.397
$tmer {cl+,cl}/$f  x   1 -1 $w  299.385
$tmer {IP_59,8}/$f  x  1 -1 $w  296.914
$tmer {IP_60,11}/$f  x  1 -1 $w  235.869
$tmer {IP_61,12}/$f  x  1 -1 $w  301.109
$tmer {IP_62,13}/$f  x  1 -1 $w  292.676
$tmer {IP_63,14}/$f  x  1 -1 $w  371.700
$tmer {IP_64,18}/$f  x  1 -1 $w  255.331
$tmer {IP_65,IP_n65}/$f  x 1 -1 $w  234.943
$tmer {IP_66,19}/$f  x 1 -1 $w  226.716
$tmer {IP_67,20}/$f  x 1 -1 $w  227.907
$tmer {IP_68,137}/$f  x 1 -1 $w  240.144
$tmer {IP_70,22}/$f  x 1 -1 $w  295.462
$tmer {IP_71,25}/$f  x 1 -1 $w  264.563
$tmer {IP_72,26}/$f  x 1 -1 $w  243.797
$tmer {IP_73,30}/$f  x 1 -1 $w  323.116
$tmer {IP_74,34}/$f  x 1 -1 $w  359.609
$tmer {IP_75,37}/$f  x 1 -1 $w  278.293
$tmer {IP_76,43}/$f  x 1 -1 $w  243.030
$tmer {IP_77,44}/$f  x 1 -1 $w  216.429
$tmer {IP_78,45}/$f  x 1 -1 $w  265.941
$tmer {IP_79,51}/$f  x 1 -1 $w  292.613
$tmer {IP_80,48}/$f  x 1 -1 $w  261.154            
