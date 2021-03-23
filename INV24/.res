if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#INV24: Goerigk, Sharma, Can. J. Chem. 2016, 94, 1133-1143
#linear TS
$tmer H2O{,_TS}/$f   x -1 1 $w 31.7       #W2-F12
$tmer H2S{,_TS}/$f   x -1 1 $w 69.3       #W2-F12
$tmer SO2{,_TS}/$f   x -1 1 $w 60.6       #W2-F12
$tmer Ether{,_TS}/$f   x -1 1 $w 37.0   #W2-F12
$tmer Thioether{,_TS}/$f   x -1 1 $w 74.2   #W2-F12
#inversion of trigonal pyramidal compounds
$tmer NMe3{,_TS}/$f   x -1 1 $w 9.7      #W2-F12
$tmer NCl3{,_TS}/$f   x -1 1 $w 18.9     #W2-F12
$tmer PMe3{,_TS}/$f   x -1 1 $w 43.2    #W2-F12
$tmer PCl3{,_TS}/$f   x -1 1 $w 79.7    #W2-F12
$tmer PH2Ph{,_TS}/$f   x -1 1 $w 31.2 #W2-F12  
$tmer PPh3{,_TS}/$f   x -1 1 $w 29.3 #DLPNO-CCSD(T)/CBS(def2-TZVPP,def2-QZVPP) 
#inversion between ring conformations
$tmer Dibenzocycloheptene{,_TS}/$f   x -1 1 $w 10.3  #DLPNO-CCSD(T)/CBS(def2-TZVPP,def2-QZVPP)
#inversion in helical compounds
$tmer Tetrahelicene{,_TS}/$f   x -1 1 $w 4.5    #W1-F12 Amir's paper
$tmer Pentahelicene{,_TS}/$f   x -1 1 $w 24.7 #DLPNO-CCSD(T)/CBS(def2-TZVPP,def2-QZVPP)
$tmer Hexahelicene{,_TS}/$f   x -1 1 $w 37.6  #DLPNO-CCSD(T)/CBS(def2-TZVPP,def2-QZVPP) 
$tmer Dibenzocarbazole{,_TS}/$f   x -1 1 $w 4.1 #DLPNO-CCSD(T)/CBS(def2-TZVPP,def2-QZVPP)
$tmer Methinecyanine{,_TS}/$f   x -1 1 $w  13.1 #DLPNO-CCSD(T)/CBS(def2-TZVPP,def2-QZVPP)
#inversion in bowls
$tmer Corannulene{,_TS}/$f x -1 1 $w 11.2 #DLPNO-CCSD(T)/CBS(def2-TZVPP,def2-QZVPP)
$tmer BN_Corannulene{,_TS}/$f x -1 1 $w 6.2 #DLPNO-CCSD(T)/CBS(def2-TZVPP,def2-QZVPP)
$tmer Sumanene{,_TS}/$f x -1 1 $w 21.3 #DLPNO-CCSD(T)/CBS(def2-TZVPP,def2-QZVPP) 
$tmer Triazasumanene{,_TS}/$f x -1 1 $w 42.3  #DLPNO-CCSD(T)/CBS(def2-TZVPP,def2-QZVPP) 
$tmer BN_Sumanene{,_TS}/$f x -1 1 $w 27.2 #DLPNO-CCSD(T)/CBS(def2-TZVPP,def2-QZVPP)
$tmer Tetrabenzopyracylene{,_TS}/$f x -1 1 $w 8.4 #DLPNO-CCSD(T)/CBS(def2-TZVPP,def2-QZVPP)
$tmer Triindenotriphenylene{,_TS}/$f x -1 1 $w 68.6  #DLPNO-CCSD(T)/CBS(def2-TZVPP,def2-QZVPP)
