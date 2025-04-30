if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

$tmer {C6H12O,H2O2,ethyl-g-butyrolactone,H2O}/$f             x -1 -2 1 3 $w -150.81
$tmer {C4H9NH2,H2O2,C4H9NO2,H2O}/$f                          x -1 -3 1 4 $w -144.38
$tmer {C4H9CHO,H2O2,C4H9CO2H,H2O}/$f                         x -1 -1 1 1 $w -89.35
$tmer {C4H9SO2H,H2O2,C4H9SO3H,H2O}/$f                        x -1 -1 1 1 $w -82.55
$tmer {trans-2-pentene,H2O2,pentanediol}/$f                  x -1 -1 1   $w -78.51
$tmer {toluene,H2,methylcyclohexane}/$f                      x -1 -3 1   $w -66.96
$tmer {pentanol,H2O2,C4H9CHO,H2O}/$f                         x -1 -1 1 2 $w -63.89
$tmer {C2H5O_2,C2H4OH_2}/$f                                  x -1 1      $w -58.53
$tmer {3-hexene,H2O2,diethyloxirane,H2O}/$f                  x -1 -1 1 1 $w -56.64
$tmer {S_C2H5_2,H2O2,OS_C2H5_2,H2O}/$f                       x -1 -1 1 1 $w -52.85
$tmer {ax-methylcyclohexene,eq-methylcyclohexene}/$f         x -1 1      $w -52.60
$tmer {hexyne,H2,1-hexene}/$f                                x -1 -1 1   $w -46.72
$tmer {2-pentyne,H2,trans-2-pentene}/$f                      x -1 -1 1   $w -44.82
$tmer {2-pentyne,H2,cis-2-pentene}/$f                        x -1 -1 1   $w -43.67
$tmer {2-pentyne,HCN,C2H5CCNCHCH3}/$f                        x -1 -1 1   $w -42.89
$tmer {1-hexene,H2,n-hexane}/$f                              x -1 -1 1   $w -37.08
$tmer {1-pentyne,H2O,C4H9CHO}/$f                             x -1 -1 1   $w -34.93
$tmer {C3H7NH2,COCl2,CO_2NHC3H7_2,HCl}/$f                    x -2 -1 1 2 $w -32.47
$tmer {eq-methylcyclohexene,H2,methylcyclohexane}/$f         x -1 -1 1   $w -32.10
$tmer {trans-2-pentene,Cl2,C2H5CClCHCH3,HCl}/$f              x -1 -1 1 1 $w -31.22
$tmer {2-pentyne,HCl,C2H5CClCHCH3}/$f                        x -1 -1 1   $w -29.98
$tmer {1-pentene,ethene,Heptene}/$f                          x -1 -1 1   $w -25.84
$tmer {C4H9CHO,H2,pentanol}/$f                               x -1 -1 1   $w -23.47
$tmer {dimethyloxirane,H2O,butanediol}/$f                    x -1 -1 1   $w -22.45
$tmer {methylpyridine,H2,dimethylpyrrole}/$f                 x -1 -1 1   $w -20.27
$tmer {C4H9NCO,NH3,C4H9NHCONH2}/$f                           x -1 -1 1   $w -19.72
$tmer {C3H7CN,H2O,C3H7CONH2}/$f                              x -1 -1 1   $w -19.34
$tmer {propylfuran,H2S,propylthiophene,H2O}/$f               x -1 -1 1 1 $w -19.45
$tmer {diethylamine,CO,HCON_C2H5_2}/$f                       x -1 -1 1   $w -17.39
$tmer {C3H7NCO,H2O,C3H7NH2,CO2}/$f                           x -1 -1 1 1 $w -16.98
$tmer {C3H7CO2C2H3,ethyl-g-butyrolactone}/$f                 x -1 1      $w -16.14
$tmer {H2C-C5-CH2,heptatriyne}/$f                            x -1 1      $w -14.30
$tmer {methylpyrazole,methylimidazole}/$f                    x -1 1      $w -13.14
$tmer {1-pentene,H2O,pentanol}/$f                            x -1 -1 1   $w -11.68
$tmer {methylfuran,NH3,methylpyrrole,H2O}/$f                 x -1 -1 1 1 $w -10.70
$tmer {C3H7CHCO,H2CO,propyloxirane,CO}/$f                    x -1 -1 1 1 $w -9.39
$tmer {pentanol,CO,HCO2C5H11}/$f                             x -1 -1 1   $w -8.53
$tmer {C3H7S_2,H2,C3H7SH}/$f                                 x -1 -1 2   $w -6.63
$tmer {pentadiene,ethene,ax-methylcyclohexene}/$f            x 1 1 -1    $w -6.65
$tmer {hexandione,methyl-d-valerolactone}/$f                 x -1 1      $w -6.45
$tmer {C2H5CO2H,methanol,C2H5CO2CH3,H2O}/$f                  x -1 -1 1 1 $w -5.11
$tmer {C4H9ONO,C4H9NO2}/$f                                   x -1 1      $w -3.25
$tmer {n-hexane,neo-hexane}/$f                               x -1 1      $w -2.64
$tmer {methylcyclohexa-14-diene,methylcyclohexa-13-diene}/$f x -1 1      $w -2.48
$tmer {1-pentene,trans-2-pentene}/$f                         x -1 1      $w -2.11
$tmer {toluene,H2,methylcyclohexa-13-diene}/$f               x -1 -1 1   $w -1.47
$tmer {cis-2-pentene,trans-2-pentene}/$f                     x -1 1      $w -1.15
$tmer {3-methylpentane,dimethylbutane}/$f                    x -1 1      $w -0.86
$tmer {C2H5CO2H,NH3,C2H5CONH2,H2O}/$f                        x -1 -1 1 1 $w -0.43
$tmer {n-nonane,tetramethylpentane}/$f                       x -1 1      $w -0.41
$tmer {C3H7CO2H,NH3,C3H7CONH2,H2O}/$f                        x -1 -1 1 1 $w -0.18
