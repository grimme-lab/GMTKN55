if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

# extended RG systems. TPSS-D3/def2-TZVP or close to that using
# # W4 monomer geometries. E_relax = 0 always
# # SG 11/2016
$tmer {ne2,ne}/$f         x -1 2   $w  0.08 # CCSD(T)/CBS(aug-cc-pVTZ/aug-cc-pVQZ) (CP corrected)
$tmer {ar2,ar}/$f         x -1 2   $w  0.27 # CCSD(T)/CBS(aug-cc-pVTZ/aug-cc-pVQZ) (CP corrected)
$tmer {kr2,kr}/$f         x -1 2   $w  0.40 # CCSD(T)/CBS(aug-cc-pVTZ/aug-cc-pVQZ) (CP corrected)
$tmer {ne3,ne}/$f         x -1 3   $w  0.27 # CCSD(T)/CBS(aug-cc-pwCVTZ/aug-cc-pwCVQZ) (no frozen core)
$tmer {ar3,ar}/$f         x -1 3   $w  0.77 # CCSD(T)/CBS(aug-cc-pwCVTZ/aug-cc-pwCVQZ) (no frozen core)
$tmer {kr3,kr}/$f         x -1 3   $w  1.18 # CCSD(T)/CBS(aug-cc-pwCVTZ/aug-cc-pwCVQZ) (no frozen core)
$tmer {ne4,ne}/$f         x -1 4   $w  0.54 # CCSD(T)/CBS(aug-cc-pwCVTZ/aug-cc-pwCVQZ) (no frozen core)
$tmer {ar4,ar}/$f         x -1 4   $w  1.51 # CCSD(T)/CBS(aug-cc-pwCVTZ/aug-cc-pwCVQZ) (no frozen core)
$tmer {ne6,ne}/$f         x -1 6   $w  1.13 # CCSD(T)/CBS(aug-cc-pwCVTZ/aug-cc-pwCVQZ) (no frozen core)
$tmer {hfNe,ne,hf}/$f     x -1 1 1 $w  0.23 # CCSD(T)/CBS(aug-cc-pVTZ/aug-cc-pVQZ) (CP corrected)
$tmer {hfAr,ar,hf}/$f     x -1 1 1 $w  0.59 # CCSD(T)/CBS(aug-cc-pVTZ/aug-cc-pVQZ) (CP corrected)
$tmer {hfKr,kr,hf}/$f     x -1 1 1 $w  0.72 # CCSD(T)/CBS(aug-cc-pVTZ/aug-cc-pVQZ) (CP corrected)
$tmer {c2h2Ne,ne,c2h2}/$f x -1 1 1 $w  0.12 # CCSD(T)/CBS(aug-cc-pVTZ/aug-cc-pVQZ) (CP corrected)
$tmer {c2h2Ar,ar,c2h2}/$f x -1 1 1 $w  0.33 # CCSD(T)/CBS(aug-cc-pVTZ/aug-cc-pVQZ) (CP corrected)
$tmer {c2h6Ne,ne,c2h6}/$f x -1 1 1 $w  0.24 # CCSD(T)/CBS(aug-cc-pVTZ/aug-cc-pVQZ) (CP corrected)
$tmer {c2h6Ar,ar,c2h6}/$f x -1 1 1 $w  0.54 # CCSD(T)/CBS(aug-cc-pVTZ/aug-cc-pVQZ) (CP corrected)
$tmer {bzNe,ne,bz}/$f     x -1 1 1 $w  0.40 # CCSD(T)/CBS(aug-cc-pVTZ/aug-cc-pVQZ) (CP corrected)
$tmer {bzAr,ar,bz}/$f     x -1 1 1 $w  1.12 # CCSD(T)/CBS(aug-cc-pVTZ/aug-cc-pVQZ) (CP corrected)
