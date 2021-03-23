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
$tmer 01{A,B,}/$f  x  1 1 -1 $w    4.92
$tmer 02{A,B,}/$f  x  1 1 -1 $w    5.59
$tmer 03{A,B,}/$f  x  1 1 -1 $w    6.91
$tmer 04{A,B,}/$f  x  1 1 -1 $w    8.10
$tmer 05{A,B,}/$f  x  1 1 -1 $w    5.76
$tmer 06{A,B,}/$f  x  1 1 -1 $w    7.55
$tmer 07{A,B,}/$f  x  1 1 -1 $w    8.23
$tmer 08{A,B,}/$f  x  1 1 -1 $w    5.01
$tmer 09{A,B,}/$f  x  1 1 -1 $w    3.06
$tmer 10{A,B,}/$f  x  1 1 -1 $w    4.16
$tmer 11{A,B,}/$f  x  1 1 -1 $w    5.42
$tmer 12{A,B,}/$f  x  1 1 -1 $w    7.27
$tmer 13{A,B,}/$f  x  1 1 -1 $w    6.19
$tmer 14{A,B,}/$f  x  1 1 -1 $w    7.45
$tmer 15{A,B,}/$f  x  1 1 -1 $w    8.63
$tmer 16{A,B,}/$f  x  1 1 -1 $w    5.12
$tmer 17{A,B,}/$f  x  1 1 -1 $w    17.18
$tmer 18{A,B,}/$f  x  1 1 -1 $w    6.86
$tmer 19{A,B,}/$f  x  1 1 -1 $w    7.41
$tmer 20{A,B,}/$f  x  1 1 -1 $w    19.09
$tmer 21{A,B,}/$f  x  1 1 -1 $w    16.26
$tmer 22{A,B,}/$f  x  1 1 -1 $w    19.49
$tmer 23{A,B,}/$f  x  1 1 -1 $w    19.19
#dispersion
$tmer 24{A,B,}/$f  x  1 1 -1 $w    2.82
$tmer 25{A,B,}/$f  x  1 1 -1 $w    3.90
$tmer 26{A,B,}/$f  x  1 1 -1 $w    9.83
$tmer 27{A,B,}/$f  x  1 1 -1 $w    3.44
$tmer 28{A,B,}/$f  x  1 1 -1 $w    5.71
$tmer 29{A,B,}/$f  x  1 1 -1 $w    6.82
$tmer 30{A,B,}/$f  x  1 1 -1 $w    1.43
$tmer 31{A,B,}/$f  x  1 1 -1 $w    3.38
$tmer 32{A,B,}/$f  x  1 1 -1 $w    3.74
$tmer 33{A,B,}/$f  x  1 1 -1 $w    1.87
$tmer 34{A,B,}/$f  x  1 1 -1 $w    3.78
$tmer 35{A,B,}/$f  x  1 1 -1 $w    2.61 
$tmer 36{A,B,}/$f  x  1 1 -1 $w    1.78 
$tmer 37{A,B,}/$f  x  1 1 -1 $w    2.40 
$tmer 38{A,B,}/$f  x  1 1 -1 $w    3.00 
$tmer 39{A,B,}/$f  x  1 1 -1 $w    3.58
$tmer 40{A,B,}/$f  x  1 1 -1 $w    2.90
$tmer 41{A,B,}/$f  x  1 1 -1 $w    4.85
$tmer 42{A,B,}/$f  x  1 1 -1 $w    4.14
$tmer 43{A,B,}/$f  x  1 1 -1 $w    3.71
$tmer 44{A,B,}/$f  x  1 1 -1 $w    2.01
$tmer 45{A,B,}/$f  x  1 1 -1 $w    1.75
$tmer 46{A,B,}/$f  x  1 1 -1 $w    4.26
#others
$tmer 47{A,B,}/$f  x  1 1 -1 $w    2.88
$tmer 48{A,B,}/$f  x  1 1 -1 $w    3.54
$tmer 49{A,B,}/$f  x  1 1 -1 $w    3.33
$tmer 50{A,B,}/$f  x  1 1 -1 $w    2.87
$tmer 51{A,B,}/$f  x  1 1 -1 $w    1.52
$tmer 52{A,B,}/$f  x  1 1 -1 $w    4.71
$tmer 53{A,B,}/$f  x  1 1 -1 $w    4.36
$tmer 54{A,B,}/$f  x  1 1 -1 $w    3.28
$tmer 55{A,B,}/$f  x  1 1 -1 $w    4.19
$tmer 56{A,B,}/$f  x  1 1 -1 $w    3.23
$tmer 57{A,B,}/$f  x  1 1 -1 $w    5.28
$tmer 58{A,B,}/$f  x  1 1 -1 $w    4.15
$tmer 59{A,B,}/$f  x  1 1 -1 $w    2.85
$tmer 60{A,B,}/$f  x  1 1 -1 $w    4.87
$tmer 61{A,B,}/$f  x  1 1 -1 $w    2.91
$tmer 62{A,B,}/$f  x  1 1 -1 $w    3.53
$tmer 63{A,B,}/$f  x  1 1 -1 $w    3.80
$tmer 64{A,B,}/$f  x  1 1 -1 $w    3.00
$tmer 65{A,B,}/$f  x  1 1 -1 $w    3.99
$tmer 66{A,B,}/$f  x  1 1 -1 $w    3.97
