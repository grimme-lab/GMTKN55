if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

# PNO-LCCSD(T)-F12b/Tight/AVQZ' (Molpro 2023.2) (Hansen, 01/2024)
# first half of original UPU46 set (Kruse et al.)
$tmer {2p,1a}/$f      x       -1      1       $w      5.35
$tmer {2p,1b}/$f      x       -1      1       $w      3.96
$tmer {2p,1c}/$f      x       -1      1       $w      9.59
$tmer {2p,1g}/$f      x       -1      1       $w      2.58
$tmer {2p,1p}/$f      x       -1      1       $w      2.37
$tmer {2p,2a}/$f      x       -1      1       $w      2.78
$tmer {2p,5z}/$f      x       -1      1       $w      0.39
$tmer {2p,6p}/$f      x       -1      1       $w      3.28
$tmer {2p,7a}/$f      x       -1      1       $w      8.27
$tmer {2p,aa}/$f      x       -1      1       $w      4.16
$tmer {2p,1e}/$f      x       -1      1       $w      11.58
$tmer {2p,0a}/$f      x       -1      1       $w      5.79
$tmer {2p,1f}/$f      x       -1      1       $w      13.89
$tmer {2p,9a}/$f      x       -1      1       $w      5.34
$tmer {2p,4b}/$f      x       -1      1       $w      5.54
$tmer {2p,3a}/$f      x       -1      1       $w      7.21
$tmer {2p,7p}/$f      x       -1      1       $w      3.82
$tmer {2p,8d}/$f      x       -1      1       $w      6.40
$tmer {2p,3d}/$f      x       -1      1       $w      5.50
$tmer {2p,0b}/$f      x       -1      1       $w      6.36
$tmer {2p,1m}/$f      x       -1      1       $w      6.56
$tmer {2p,2h}/$f      x       -1      1       $w      10.63
$tmer {2p,3b}/$f      x       -1      1       $w      6.46
