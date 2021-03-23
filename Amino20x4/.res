if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#alanine
$tmer ALA_{xag,xac}/$f x -1 1  $w  1.169
$tmer ALA_{xag,xak}/$f x -1 1  $w  3.049
$tmer ALA_{xag,xai}/$f x -1 1  $w  3.319
$tmer ALA_{xag,xab}/$f x -1 1  $w  5.044
#arginine
$tmer ARG_{xci,xak}/$f x -1 1  $w  1.576
$tmer ARG_{xci,xbv}/$f x -1 1  $w  2.529
$tmer ARG_{xci,xbx}/$f x -1 1  $w  2.800
$tmer ARG_{xci,xby}/$f x -1 1  $w  6.459
#Asparagine
$tmer ASN_{xaf,xaj}/$f x -1 1  $w  0.388
$tmer ASN_{xaf,xae}/$f x -1 1  $w  4.109
$tmer ASN_{xaf,xab}/$f x -1 1  $w  4.760
$tmer ASN_{xaf,xah}/$f x -1 1  $w  6.532
#Aspartic acid
$tmer ASP_{xaz,xad}/$f x -1 1  $w  0.157
$tmer ASP_{xaz,xay}/$f x -1 1  $w  1.974
$tmer ASP_{xaz,xau}/$f x -1 1  $w  2.897
$tmer ASP_{xaz,xbc}/$f x -1 1  $w  3.113
#Cysteine
$tmer CYS_{xai,xah}/$f x -1 1  $w 0.277
$tmer CYS_{xai,xag}/$f x -1 1  $w 0.979
$tmer CYS_{xai,xao}/$f x -1 1  $w 0.992
$tmer CYS_{xai,xal}/$f x -1 1  $w 2.373
#Glu amine
$tmer GLN_{xai,xan}/$f x -1 1  $w  0.424
$tmer GLN_{xai,xat}/$f x -1 1  $w  3.272
$tmer GLN_{xai,xap}/$f x -1 1  $w  4.045
$tmer GLN_{xai,xal}/$f x -1 1  $w  4.152
#Glutamic acid
$tmer GLU_{xbi,xav}/$f x -1 1  $w  1.335
$tmer GLU_{xbi,xal}/$f x -1 1  $w  1.545
$tmer GLU_{xbi,xar}/$f x -1 1  $w  2.939
$tmer GLU_{xbi,xad}/$f x -1 1  $w  5.216
#Glycine
$tmer GLY_{xac,xae}/$f x -1 1  $w  1.091
$tmer GLY_{xac,xad}/$f x -1 1  $w  2.627
$tmer GLY_{xac,xab}/$f x -1 1  $w  2.743
$tmer GLY_{xac,xag}/$f x -1 1  $w  4.086
#Histidine
$tmer HIS_{xaq,xam}/$f x -1 1  $w  2.769
$tmer HIS_{xaq,xah}/$f x -1 1  $w  2.992
$tmer HIS_{xaq,xau}/$f x -1 1  $w  7.318
$tmer HIS_{xaq,xav}/$f x -1 1  $w  7.370
#Isoleucine
$tmer ILE_{xae,xaj}/$f x -1 1  $w  0.187
$tmer ILE_{xae,xaq}/$f x -1 1  $w  0.595
$tmer ILE_{xae,xag}/$f x -1 1  $w  0.963
$tmer ILE_{xae,xak}/$f x -1 1  $w  0.995
#Leucine
$tmer LEU_{xap,xad}/$f x -1 1  $w  0.338
$tmer LEU_{xap,xae}/$f x -1 1  $w  1.524
$tmer LEU_{xap,xbb}/$f x -1 1  $w  1.686
$tmer LEU_{xap,xaq}/$f x -1 1  $w  1.952
#Lysine
$tmer LYS_{xap,xao}/$f x -1 1  $w  0.058
$tmer LYS_{xap,xan}/$f x -1 1  $w  0.199
$tmer LYS_{xap,xas}/$f x -1 1  $w  0.456
$tmer LYS_{xap,xat}/$f x -1 1  $w  0.540
#Methionine
$tmer MET_{xbf,xag}/$f x -1 1  $w  1.814
$tmer MET_{xbf,xbm}/$f x -1 1  $w  2.459
$tmer MET_{xbf,xav}/$f x -1 1  $w  2.466
$tmer MET_{xbf,xbo}/$f x -1 1  $w  2.896
#Phenylalanine
$tmer PHE_{xaw,xab}/$f x -1 1  $w  0.872
$tmer PHE_{xaw,xar}/$f x -1 1  $w  1.719
$tmer PHE_{xaw,xan}/$f x -1 1  $w  1.840
$tmer PHE_{xaw,xal}/$f x -1 1  $w  1.889
#Proline
$tmer PRO_{xae,xad}/$f x -1 1  $w  1.396
$tmer PRO_{xae,xac}/$f x -1 1  $w  3.211
$tmer PRO_{xae,xaf}/$f x -1 1  $w  4.187
$tmer PRO_{xae,xab}/$f x -1 1  $w  6.014
#Serine
$tmer SER_{xad,xah}/$f x -1 1  $w  3.026
$tmer SER_{xad,xaf}/$f x -1 1  $w  3.103
$tmer SER_{xad,xak}/$f x -1 1  $w  3.513
$tmer SER_{xad,xar}/$f x -1 1  $w  4.183
#Threonine
$tmer THR_{xaq,xab}/$f x -1 1  $w  1.339
$tmer THR_{xaq,xag}/$f x -1 1  $w  3.080
$tmer THR_{xaq,xah}/$f x -1 1  $w  3.506
$tmer THR_{xaq,xal}/$f x -1 1  $w  4.224
#Tryp ophan
$tmer TRP_{xao,xag}/$f x -1 1  $w  1.293
$tmer TRP_{xao,xah}/$f x -1 1  $w  2.828
$tmer TRP_{xao,xaf}/$f x -1 1  $w  3.244
$tmer TRP_{xao,xac}/$f x -1 1  $w  4.057
#Tyrosine
$tmer TYR_{xag,xar}/$f x -1 1  $w  0.093
$tmer TYR_{xag,xab}/$f x -1 1  $w  0.903
$tmer TYR_{xag,xah}/$f x -1 1  $w  1.707
$tmer TYR_{xag,xan}/$f x -1 1  $w  1.772
#Valine
$tmer VAL_{xad,xaj}/$f x -1 1  $w  0.849
$tmer VAL_{xad,xah}/$f x -1 1  $w  0.860
$tmer VAL_{xad,xaf}/$f x -1 1  $w  1.355
$tmer VAL_{xad,xak}/$f x -1 1  $w  1.484
