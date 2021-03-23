if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer {ed,ts}1/$f  x -1 1 $w 25.65  # org. h2o split from Marek
$tmer {ed,ts}2/$f  x -1 1 $w 56.90  # B-N dewar benzene formation
$tmer {ed,ts}3/$f  x -1 1 $w 36.53  # Marek
$tmer {ed,ts}4/$f  x -1 1 $w 96.17  # ethene-methane
$tmer {ed,ts}5/$f  x -1 1 $w 15.94  # h2 FLP model (COSMO opt.)
$tmer {ed,ts}6/$f  x -1 1 $w 13.64  # co2 FLP model (COSMO opt.)
$tmer {ed,ts}7/$f  x -1 1 $w 27.49  # Si/BHCl2 exchange
$tmer {ed,ts}8/$f  x -1 1 $w 50.24  # C2H2 trimer. to benzene
$tmer {ed,ts}9/$f  x -1 1 $w 65.84  # 1,3-silylshift in allylsilane
$tmer {ed,ts}10/$f x -1 1 $w 64.93  # 1,2-ch3 shift in ch3cn (H-shift case in BH76)
# # # nonrel. W2-F12 and W1-F12 (barriers 3 and 7) reference values
# # # various chemically interesting TS, PBEh-3c opt
