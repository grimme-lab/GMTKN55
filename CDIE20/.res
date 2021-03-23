if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer	R20/$f	P20/$f	x	-1	1	$w	-3.3
$tmer	R21/$f	P20/$f	x	-1	1	$w	4.4
$tmer	R22/$f	P22/$f	x	-1	1	$w	-5.9
$tmer	R25/$f	P25/$f	x	-1	1	$w	-4.8
$tmer	R26/$f	P26/$f	x	-1	1	$w	-2.5
$tmer	R28/$f	P26/$f	x	-1	1	$w	4.0
$tmer	R29/$f	P25/$f	x	-1	1	$w	4.5
$tmer	R40/$f	P40/$f	x	-1	1	$w	1.7
$tmer	R43/$f	P43/$f	x	-1	1	$w	2.9
$tmer	R44/$f	P44/$f	x	-1	1	$w	3.7
$tmer	R45/$f	P45/$f	x	-1	1	$w	1.2
$tmer	R46/$f	P46/$f	x	-1	1	$w	3.7
$tmer	R47/$f	P47/$f	x	-1	1	$w	3.8
$tmer	R48/$f	P48/$f	x	-1	1	$w	4.4
$tmer	R49/$f	P49/$f	x	-1	1	$w	4.2
$tmer	R51/$f	P51/$f	x	-1	1	$w	1.6
$tmer	R52/$f	P52/$f	x	-1	1	$w	4.2
$tmer	R56/$f	P56/$f	x	-1	1	$w	5.9
$tmer	R57/$f	P51/$f	x	-1	1	$w	5.8
$tmer	R60/$f	P60/$f	x	-1	1	$w	8.6
#W1-F12 refs, B3LYP-D3/def2-TZVP geoms
##taken from Karton's DIE60 benchmark set, Chem. Phys. 2014, 441, 166-177.
