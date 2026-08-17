if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

# water binding energy benchmark 
# Level of theory:
# 1. Post CCSD(T) corrected (arXiv:2308.06120)
#   - H2O20*: MP2-F12/[TQ]Z CP + Two-body{CCSD(F12*)/QZ + (T)/ha[TQ]Z} + Three-body{CCSD(F12*)/TZ + (T)/ha[DT]Z}  + dE(CV) + dE(post-CCSD(T))
#   - H2O6*: MP2-F12/[Q5]Z CP + CCSD(F12*)/a[DT]Z CP + CCSD(T)/ha[DT]Z CP + dE(CV) + dE(post-CCSD(T))
# 1. J. Chem. Theory Comput. (2017) 13 (7): 3136–3152 (doi:10.1021/acs.jctc.6b01046)
#   - OHm*: MP2-F12/[TQ]Z CP + CCSD(F12*)/a[DT]Z CP + CCSD(T)/ha[DT]Z CP
#   - rest: MP2-F12/[Q5]Z CP + CCSD(F12*)/a[DT]Z CP + CCSD(T)/ha[DT]Z CP
$tmer {H1O2,H2O}/$f            x -1  2  $w   4.97
$tmer {H1O3,H2O}/$f            x -1  3  $w  15.71
$tmer {H1O4,H2O}/$f            x -1  4  $w  27.35
$tmer {H1O5,H2O}/$f            x -1  5  $w  35.88
$tmer {H1O6,H2O}/$f            x -1  6  $w  45.99
$tmer {H1O6c,H2O}/$f           x -1  6  $w  45.73
$tmer {H1O6b,H2O}/$f           x -1  6  $w  45.29
$tmer {H1O6c2,H2O}/$f          x -1  6  $w  44.30
$tmer {H1O8d2d,H2O}/$f         x -1  8  $w  72.49
$tmer {H1O8s4,H2O}/$f          x -1  8  $w  72.45
$tmer {H1O20,H2O}/$f           x -1 20  $w 199.82 dodeca
$tmer {H1O20fc,H2O}/$f         x -1 20  $w 208.96 fused cubes
$tmer {H1O20fs,H2O}/$f         x -1 20  $w 208.99 face sh
$tmer {H1O20es,H2O}/$f         x -1 20  $w 210.76 edge sh
$tmer {H2OpH2O,H3Op,H2O}/$f    x -1 1 1 $w  33.74
$tmer {H2OpH2O2,H3Op,H2O}/$f   x -1 1 2 $w  57.11
$tmer {H2OpH2O3,H3Op,H2O}/$f   x -1 1 3 $w  76.75
$tmer {H2OpH2O63d,H3Op,H2O}/$f x -1 1 6 $w 117.68
$tmer {H2OpH2O62d,H3Op,H2O}/$f x -1 1 6 $w 114.82
$tmer {OHmH1O,OHm,H2O}/$f      x -1 1 1 $w  26.69
$tmer {OHmH1O2,OHm,H2O}/$f     x -1 1 2 $w  48.69
$tmer {OHmH1O3,OHm,H2O}/$f     x -1 1 3 $w  67.52
$tmer {OHmH1O4c4,OHm,H2O}/$f   x -1 1 4 $w  84.35
$tmer {OHmH1O4cs,OHm,H2O}/$f   x -1 1 4 $w  85.01
$tmer {OHmH1O5,OHm,H2O}/$f     x -1 1 5 $w 100.78
$tmer {OHmH1O6,OHm,H2O}/$f     x -1 1 6 $w 115.67
$tmer {H2OpH2O6OHm,H2O8s4}/$f  x  1 -1  $w  29.60
