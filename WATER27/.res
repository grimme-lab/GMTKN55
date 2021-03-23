if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#water binding energy benchmark Goddard III etal, JCTC5, 200, 1016
#b3lyp structures from ESI, est CCSD(T)/CBS ref data, tab 3, new data for H2O20, by Friedrich
$tmer {H2O2,H2O}/$f            x -1  2  $w 5.01
$tmer {H2O3,H2O}/$f            x -1  3  $w 15.8
$tmer {H2O4,H2O}/$f            x -1  4  $w 27.4
$tmer {H2O5,H2O}/$f            x -1  5  $w 35.9
$tmer {H2O6,H2O}/$f            x -1  6  $w 46.0
$tmer {H2O6c,H2O}/$f           x -1  6  $w 45.8
$tmer {H2O6b,H2O}/$f           x -1  6  $w 45.3
$tmer {H2O6c2,H2O}/$f          x -1  6  $w 44.3
$tmer {H2O8d2d,H2O}/$f         x -1  8  $w 72.6
$tmer {H2O8s4,H2O}/$f          x -1  8  $w 72.6
$tmer {H2O20,H2O}/$f           x -1 20  $w 198.6 dodeca
$tmer {H2O20fc,H2O}/$f         x -1 20  $w 208.0 fused cubes
$tmer {H2O20fs,H2O}/$f         x -1 20  $w 208.0 face sh
$tmer {H2O20es,H2O}/$f         x -1 20  $w 209.7 edge sh
$tmer {H3OpH2O,H3Op,H2O}/$f    x -1 1 1 $w  33.5
$tmer {H3OpH2O2,H3Op,H2O}/$f   x -1 1 2 $w  56.9
$tmer {H3OpH2O3,H3Op,H2O}/$f   x -1 1 3 $w  76.5
$tmer {H3OpH2O63d,H3Op,H2O}/$f x -1 1 6 $w 117.8
$tmer {H3OpH2O62d,H3Op,H2O}/$f x -1 1 6 $w 114.9
$tmer {OHmH2O,OHm,H2O}/$f      x -1 1 1 $w  26.6 
$tmer {OHmH2O2,OHm,H2O}/$f     x -1 1 2 $w  48.4 
$tmer {OHmH2O3,OHm,H2O}/$f     x -1 1 3 $w  67.6 
$tmer {OHmH2O4c4,OHm,H2O}/$f   x -1 1 4 $w  84.8 
$tmer {OHmH2O4cs,OHm,H2O}/$f   x -1 1 4 $w  84.8 
$tmer {OHmH2O5,OHm,H2O}/$f     x -1 1 5 $w 100.7
$tmer {OHmH2O6,OHm,H2O}/$f     x -1 1 6 $w 115.7
$tmer {H3OpH2O6OHm,H2O8s4}/$f  x  1 -1  $w  28.5 
