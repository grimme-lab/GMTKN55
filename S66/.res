if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

# original ref. values in the order of the paper (and not the modified order)
#H-bonds
$tmer 01{A,B,}/$f  x  1 1 -1 $w    4.991
$tmer 02{A,B,}/$f  x  1 1 -1 $w    5.674
$tmer 03{A,B,}/$f  x  1 1 -1 $w    6.996
$tmer 04{A,B,}/$f  x  1 1 -1 $w    8.191
$tmer 05{A,B,}/$f  x  1 1 -1 $w    5.827
$tmer 06{A,B,}/$f  x  1 1 -1 $w    7.625
$tmer 07{A,B,}/$f  x  1 1 -1 $w    8.313
$tmer 08{A,B,}/$f  x  1 1 -1 $w    5.071
$tmer 09{A,B,}/$f  x  1 1 -1 $w    3.091
$tmer 10{A,B,}/$f  x  1 1 -1 $w    4.189
$tmer 11{A,B,}/$f  x  1 1 -1 $w    5.442
$tmer 12{A,B,}/$f  x  1 1 -1 $w    7.360
$tmer 13{A,B,}/$f  x  1 1 -1 $w    6.250
$tmer 14{A,B,}/$f  x  1 1 -1 $w    7.518
$tmer 15{A,B,}/$f  x  1 1 -1 $w    8.688
$tmer 16{A,B,}/$f  x  1 1 -1 $w    5.178
$tmer 17{A,B,}/$f  x  1 1 -1 $w    17.403
$tmer 18{A,B,}/$f  x  1 1 -1 $w    6.929
$tmer 19{A,B,}/$f  x  1 1 -1 $w    7.465
$tmer 20{A,B,}/$f  x  1 1 -1 $w    19.383
$tmer 21{A,B,}/$f  x  1 1 -1 $w    16.485
$tmer 22{A,B,}/$f  x  1 1 -1 $w    19.748
$tmer 23{A,B,}/$f  x  1 1 -1 $w    19.424
#dispersion
$tmer 24{A,B,}/$f  x  1 1 -1 $w    2.686
$tmer 25{A,B,}/$f  x  1 1 -1 $w    3.760
$tmer 26{A,B,}/$f  x  1 1 -1 $w    9.716
$tmer 27{A,B,}/$f  x  1 1 -1 $w    3.304
$tmer 28{A,B,}/$f  x  1 1 -1 $w    5.545
$tmer 29{A,B,}/$f  x  1 1 -1 $w    6.661
$tmer 30{A,B,}/$f  x  1 1 -1 $w    1.343
$tmer 31{A,B,}/$f  x  1 1 -1 $w    3.306
$tmer 32{A,B,}/$f  x  1 1 -1 $w    3.675
$tmer 33{A,B,}/$f  x  1 1 -1 $w    1.784
$tmer 34{A,B,}/$f  x  1 1 -1 $w    3.733
$tmer 35{A,B,}/$f  x  1 1 -1 $w    2.583
$tmer 36{A,B,}/$f  x  1 1 -1 $w    1.750
$tmer 37{A,B,}/$f  x  1 1 -1 $w    2.375
$tmer 38{A,B,}/$f  x  1 1 -1 $w    2.957
$tmer 39{A,B,}/$f  x  1 1 -1 $w    3.482
$tmer 40{A,B,}/$f  x  1 1 -1 $w    2.823
$tmer 41{A,B,}/$f  x  1 1 -1 $w    4.768
$tmer 42{A,B,}/$f  x  1 1 -1 $w    4.055
$tmer 43{A,B,}/$f  x  1 1 -1 $w    3.660
$tmer 44{A,B,}/$f  x  1 1 -1 $w    1.976
$tmer 45{A,B,}/$f  x  1 1 -1 $w    1.704
$tmer 46{A,B,}/$f  x  1 1 -1 $w    4.216
#others
$tmer 47{A,B,}/$f  x  1 1 -1 $w    2.806
$tmer 48{A,B,}/$f  x  1 1 -1 $w    3.477
$tmer 49{A,B,}/$f  x  1 1 -1 $w    3.267
$tmer 50{A,B,}/$f  x  1 1 -1 $w    2.836
$tmer 51{A,B,}/$f  x  1 1 -1 $w    1.528
$tmer 52{A,B,}/$f  x  1 1 -1 $w    4.691
$tmer 53{A,B,}/$f  x  1 1 -1 $w    4.375
$tmer 54{A,B,}/$f  x  1 1 -1 $w    3.263
$tmer 55{A,B,}/$f  x  1 1 -1 $w    4.137
$tmer 56{A,B,}/$f  x  1 1 -1 $w    3.171
$tmer 57{A,B,}/$f  x  1 1 -1 $w    5.219
$tmer 58{A,B,}/$f  x  1 1 -1 $w    4.193
$tmer 59{A,B,}/$f  x  1 1 -1 $w    2.913
$tmer 60{A,B,}/$f  x  1 1 -1 $w    4.933
$tmer 61{A,B,}/$f  x  1 1 -1 $w    2.879
$tmer 62{A,B,}/$f  x  1 1 -1 $w    3.495
$tmer 63{A,B,}/$f  x  1 1 -1 $w    3.716
$tmer 64{A,B,}/$f  x  1 1 -1 $w    2.977
$tmer 65{A,B,}/$f  x  1 1 -1 $w    4.071
$tmer 66{A,B,}/$f  x  1 1 -1 $w    3.931
