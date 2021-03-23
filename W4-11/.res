if [ "$TMER" == "" ]
then
  tmer=tmer2++
else
  tmer=$TMER
fi
f=$1
w=$2

#W4 references, Zero-point exclusive, nonrelativistic, clamped-nuclei total atomization energies for benchmarking DFT functionals (kcal/mol). For further details, see Supporting Information of A. Karton, S. Daon and J. M. L. Martin, 
#Chemical Physics Letters 510, 165-178 (2011). http://dx.doi.org/10.1016/j.cplett.2011.05.007.
$tmer {h2,h}/$f  x -1 2 $w 109.493
$tmer {alh3,al,h}/$f  x -1 1 3 $w 213.169
$tmer {alh,al,h}/$f  x -1 1 1 $w 73.570
$tmer {sih4,si,h}/$f  x -1 1 4 $w 324.945
$tmer {bh3,b,h}/$f  x -1 1 3 $w 281.287
$tmer {bh,b,h}/$f  x -1 1 1 $w 84.995
$tmer {ch2-trip,c,h}/$f  x -1 1 2 $w 190.745
$tmer {sih,si,h}/$f  x -1 1 1 $w 73.921
$tmer {si2h6,si,h}/$f  x -1 2 6 $w 535.885
$tmer {ch3,c,h}/$f  x -1 1 3 $w 307.870
$tmer {ch4,c,h}/$f  x -1 1 4 $w 420.420
$tmer {b2h6,b,h}/$f  x -1 2 6 $w 607.023
$tmer {sih3f,si,h,f}/$f  x -1 1 3 1 $w 382.753
$tmer {ph3,p,h}/$f  x -1 1 3 $w 242.267
$tmer {c2h6,c,h}/$f  x -1 2 6 $w 713.080
$tmer {propane,c,h}/$f  x -1 3 8 $w 1007.909
$tmer {ch2-sing,c,h}/$f  x -1 1 2 $w 181.456
$tmer {ch,c,h}/$f  x -1 1 1 $w 84.221
$tmer {h2s,h,s}/$f  x -1 2 1 $w 183.913
$tmer {hs,h,s}/$f  x -1 1 1 $w 87.731
$tmer {c2h5f,c,h,f}/$f  x -1 2 5 1 $w 721.502
$tmer {ch3nh2,c,n,h}/$f  x -1 1 1 5 $w 582.301
$tmer {ch3f,c,f,h}/$f  x -1 1 1 3 $w 422.959
$tmer {propene,c,h}/$f  x -1 3 6 $w 861.578
$tmer {nh3,n,h}/$f  x -1 1 3 $w 298.018
$tmer {ethanol,c,o,h}/$f  x -1 2 1 6 $w 811.241
$tmer {ch3nh,c,n,h}/$f  x -1 1 1 4 $w 474.629
$tmer {c2h4,c,h}/$f  x -1 2 4 $w 564.095
$tmer {methanol,c,o,h}/$f  x -1 1 1 4 $w 513.501
$tmer {hcl,h,cl}/$f  x -1 1 1 $w 107.499
$tmer {nh2,n,h}/$f  x -1 1 2 $w 182.591
$tmer {nh,n,h}/$f  x -1 1 1 $w 83.096
$tmer {ch2nh2,c,n,h}/$f  x -1 1 1 4 $w 482.276
$tmer {bhf2,b,h,f}/$f  x -1 1 1 2 $w 410.973
$tmer {h2o,h,o}/$f  x -1 2 1 $w 232.974
$tmer {hf,h,f}/$f  x -1 1 1 $w 141.640
$tmer {ch2ch,c,h}/$f  x -1 2 3 $w 446.081
$tmer {oh,o,h}/$f  x -1 1 1 $w 107.208
$tmer {propyne,c,h}/$f  x -1 3 4 $w 705.605
$tmer {acetaldehyde,c,o,h}/$f  x -1 2 1 4 $w 677.864
$tmer {allene,c,h}/$f  x -1 3 4 $w 704.100
$tmer {sif4,si,f}/$f  x -1 1 4 $w 577.780
$tmer {bf3,b,f}/$f  x -1 1 3 $w 470.973
$tmer {c2h3f,c,f,h}/$f  x -1 2 1 3 $w 573.892
$tmer {oxirane,c,o,h}/$f  x -1 2 1 4 $w 651.526
$tmer {ch2f2,c,f,h}/$f  x -1 1 2 2 $w 437.668
$tmer {alf3,al,f}/$f  x -1 1 3 $w 430.967
$tmer {bef2,be,f}/$f  x -1 1 2 $w 309.099
$tmer {ch2c,c,h}/$f  x -1 2 2 $w 359.934
$tmer {n2h4,h,n}/$f  x -1 4 2 $w 438.281
$tmer {ch2nh,c,n,h}/$f  x -1 1 1 3 $w 439.441
$tmer {alf,al,f}/$f  x -1 1 1 $w 163.780
$tmer {acetic,c,o,h}/$f  x -1 2 2 4 $w 804.017
$tmer {c2h2,c,h}/$f  x -1 2 2 $w 405.525
$tmer {h2co,h,c,o}/$f  x -1 2 1 1 $w 374.658
$tmer {h2cn,h,c,n}/$f  x -1 2 1 1 $w 343.749
$tmer {bf,b,f}/$f  x -1 1 1 $w 182.517
$tmer {becl2,be,cl}/$f  x -1 1 2 $w 225.274
$tmer {t-hcoh,c,o,h}/$f  x -1 1 1 2 $w 322.477
$tmer {alcl3,al,cl}/$f  x -1 1 3 $w 312.651
$tmer {c-hcoh,c,o,h}/$f  x -1 1 1 2 $w 317.647
$tmer {alcl,al,cl}/$f  x -1 1 1 $w 122.618
$tmer {ketene,c,o,h}/$f  x -1 2 1 2 $w 533.462
$tmer {sif,si,f}/$f  x -1 1 1 $w 142.710
$tmer {formic,c,o,h}/$f  x -1 1 2 2 $w 501.899
$tmer {hcnh,c,n,h}/$f  x -1 1 1 2 $w 336.249
$tmer {glyoxal,c,o,h}/$f  x -1 2 2 2 $w 635.101
$tmer {hcof,c,o,f,h}/$f  x -1 1 1 1 1 $w 403.743
$tmer {nh2cl,n,cl,h}/$f  x -1 1 1 2 $w 248.059
$tmer {cf4,c,f}/$f  x -1 1 4 $w 478.760
$tmer {hccf,c,f,h}/$f  x -1 2 1 1 $w 398.472
$tmer {hcn,h,c,n}/$f  x -1 1 1 1 $w 313.418
$tmer {hnc,h,c,n}/$f  x -1 1 1 1 $w 298.203
$tmer {cch,c,h}/$f  x -1 2 1 $w 266.163
$tmer {hco,h,c,o}/$f  x -1 1 1 1 $w 279.422
$tmer {co,c,o}/$f  x -1 1 1 $w 259.727
$tmer {oxirene,c,o,h}/$f  x -1 2 1 2 $w 456.072
$tmer {f2co,c,o,f}/$f  x -1 1 1 2 $w 420.636
$tmer {hocn,c,o,n,h}/$f  x -1 1 1 1 1 $w 410.066
$tmer {hooh,h,o}/$f  x -1 2 2 $w 269.089
$tmer {t-n2h2,h,n}/$f  x -1 2 2 $w 296.534
$tmer {hnco,c,o,n,h}/$f  x -1 1 1 1 1 $w 434.737
$tmer {c-n2h2,h,n}/$f  x -1 2 2 $w 291.135
$tmer {cf2,c,f}/$f  x -1 1 2 $w 258.782
$tmer {co2,c,o}/$f  x -1 1 2 $w 390.141
$tmer {fccf,c,f}/$f  x -1 2 2 $w 386.087
$tmer {dioxirane,c,o,h}/$f  x -1 1 2 2 $w 410.029
$tmer {cf,c,f}/$f  x -1 1 1 $w 132.721
$tmer {ssh,s,h}/$f  x -1 2 1 $w 165.128
$tmer {hocl,h,o,cl}/$f  x -1 1 1 1 $w 166.229
$tmer {nccn,n,c}/$f  x -1 2 2 $w 502.037
$tmer {n2,n}/$f  x -1 2 $w 228.485
$tmer {n2h,n,h}/$f  x -1 2 1 $w 224.864
$tmer {ocs,o,c,s}/$f  x -1 1 1 1 $w 335.747
$tmer {sio,si,o}/$f  x -1 1 1 $w 193.052
$tmer {clcn,cl,c,n}/$f  x -1 1 1 1 $w 285.447
$tmer {hoo,h,o}/$f  x -1 1 2 $w 175.533
$tmer {hcno,c,o,n,h}/$f  x -1 1 1 1 1 $w 364.971
$tmer {honc,c,o,n,h}/$f  x -1 1 1 1 1 $w 350.149
$tmer {hno,h,n,o}/$f  x -1 1 1 1 $w 205.890
$tmer {hof,h,o,f}/$f  x -1 1 1 1 $w 158.653
$tmer {c-hono,h,n,o}/$f  x -1 1 1 2 $w 312.219
$tmer {t-hono,h,n,o}/$f  x -1 1 1 2 $w 312.649
$tmer {cs2,c,s}/$f  x -1 1 2 $w 280.778
$tmer {hnnn,h,n}/$f  x -1 1 3 $w 331.785
$tmer {cs,c,s}/$f  x -1 1 1 $w 172.218
$tmer {cn,c,n}/$f  x -1 1 1 $w 181.350
$tmer {so3,s,o}/$f  x -1 1 3 $w 346.943
$tmer {ccl2,c,cl}/$f  x -1 1 2 $w 177.357
$tmer {bn3pi,b,n}/$f  x -1 1 1 $w 105.815
$tmer {so2,s,o}/$f  x -1 1 2 $w 260.621
$tmer {no,n,o}/$f  x -1 1 1 $w 152.745
$tmer {so,s,o}/$f  x -1 1 1 $w 126.465
$tmer {n2o,n,o}/$f  x -1 2 1 $w 270.849
$tmer {c-hooo,h,o}/$f  x -1 1 3 $w 233.089
$tmer {s2,s}/$f  x -1 2 $w 104.251
$tmer {p4,p}/$f  x -1 4 $w 290.578
$tmer {cl2,cl}/$f  x -1 2 $w 59.750
$tmer {o2,o}/$f  x -1 2 $w 120.824
$tmer {f2,f}/$f  x -1 2 $w 39.042
$tmer {t-hooo,h,o}/$f  x -1 1 3 $w 233.297
$tmer {s2o,s,o}/$f  x -1 2 1 $w 208.781
$tmer {p2,p}/$f  x -1 2 $w 117.593
$tmer {clf,cl,f}/$f  x -1 1 1 $w 62.800
$tmer {no2,n,o}/$f  x -1 1 2 $w 227.882
$tmer {clo,cl,o}/$f  x -1 1 1 $w 65.447
$tmer {s3,s}/$f  x -1 3 $w 168.364
$tmer {cl2o,cl,o}/$f  x -1 2 1 $w 101.457
$tmer {s4-c2v,s}/$f  x -1 4 $w 234.348
$tmer {of,o,f}/$f  x -1 1 1 $w 53.075
$tmer {c2,c}/$f  x -1 2 $w 147.023
$tmer {oclo,o,cl}/$f  x -1 2 1 $w 128.120
$tmer {f2o,f,o}/$f  x -1 2 1 $w 93.780
$tmer {b2,b}/$f  x -1 2 $w 67.459
$tmer {fo2,f,o}/$f  x -1 1 2 $w 134.721
$tmer {cloo,cl,o}/$f  x -1 1 2 $w 126.385
$tmer {foof,f,o}/$f  x -1 2 2 $w 152.369
$tmer {o3,o}/$f  x -1 3 $w 147.428
$tmer {bn,b,n}/$f  x -1 1 1 $w 105.239
$tmer {be2,be}/$f  x -1 2 $w 2.669
