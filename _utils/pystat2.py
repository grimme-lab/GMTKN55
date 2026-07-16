#!/usr/bin/python3

import math
import sys

# Collect arguments
# lmax = len(sys.argv)
# l=2
# m=0
# arglist = []
# while True:
#    if l > lmax:
#        break
#    m =l-1
#    sys.argv[m]=sys.argv[m].lower()
#    arglist.append(sys.argv[m])
#    l=l+1
# Anzahl Argumente:
# numberarg = len(arglist)-1

mydata = sys.stdin.readlines()

# print(len(mydata))

# linecounter=0
statcounter = 0

rms = 0.0
mad = 0.0
md = 0.0
relrms = 0.0
relmad = 0.0
relmd = 0.0
relvariance = 0.0
relmaxabsdev = 0.0
rel = " "

# N= 30 MD= 51.65 MAD= 51.65 RMS= 61.05 Error Range=187.43 MaxDev=210.93 MinDev= 23.50   N>3=30   AmaxDev at =13

for line in mydata:
    linesplit = line.split()
    if len(linesplit) == 2:
        rel = "y"
        mystring1 = linesplit[0].strip()
        mystring2 = linesplit[1].strip()
        if len(mystring1) == 0:
            continue
        if len(mystring2) == 0:
            continue
        else:
            try:
                value1 = float(mystring1)
                value2 = float(mystring2)
            except ValueError:
                print("Conversion to float failed for")
                print(line)
                sys.exit()
                #            if (abs(value1)>200.0):
                print("Value is too large, exiting")
                print(line)
                sys.exit()
                #            if (abs(value2)>200.0):
                print("Value is too large, exiting")
                print(line)
                sys.exit()
            value = value2 - value1
            if value1 == 0:
                value1 += 0.0000001
            relvalue = value / value1
            relrms = relrms + relvalue * relvalue
            relmad = relmad + abs(relvalue)
            relmd = relmd + relvalue
    else:
        mystring = line.strip()  # strip all whitespace
        if len(mystring) == 0:
            continue  # if string contains nothing but whitespace, continue
        else:
            try:
                value = float(mystring)
            except ValueError:
                print("Conversion to float failed for")
                print(line)
                sys.exit()

                #            if (abs(value)>200.0):
                print("Value is too large, exiting")
                print(line)
                sys.exit()

    statcounter = statcounter + 1

    rms = rms + value * value
    mad = mad + abs(value)
    md = md + value


# variance / stddev implementation
# s^2 = \frac{1}{n-1} \sum_{i=1}^n (x_i - \overline{x})^2 % where overline x is the average

md = md / float(statcounter)
mad = mad / float(statcounter)
rms = math.sqrt(rms / float(statcounter))

relmd = relmd / float(statcounter)
relmad = relmad / float(statcounter)
relrms = math.sqrt(relrms / float(statcounter))

variance = 0.0

max = md
min = md
maxabsdev = 0.0
maxabsdevpos = 0

linecounter = 0

if statcounter > 1:

    for line in mydata:
        #    print( lines )
        if len(linesplit) == 2:
            linesplit = line.split()
            mystring1 = linesplit[0].strip()
            mystring2 = linesplit[1].strip()
            linecounter = linecounter + 1
            if len(mystring1) == 0:
                continue
            if len(mystring2) == 0:
                continue
            else:
                try:
                    value1 = float(mystring1)
                    value2 = float(mystring2)
                except ValueError:
                    print("Conversion to float failed for")
                    print(line)
                    sys.exit()
                value = value2 - value1
                if value1 == 0:
                    value1 += 0.0000001
                relvalue = value / value1
                relvariance = relvariance + (relvalue - relmd) * (
                    relvalue - relmd
                )
                if relmaxabsdev < abs(relvalue):
                    relmaxabsdev = abs(relvalue)

        else:
            mystring = line.strip()  # strip all whitespace
            linecounter = linecounter + 1
            if len(mystring) == 0:
                continue  # if string contains nothing but whitespace, continue
            else:
                try:
                    value = float(mystring)
                except ValueError:
                    print("Conversion to float failed for")
                    print(line)
                    sys.exit()

        variance = variance + (value - md) * (value - md)

        if max < value:
            max = value
        if min > value:
            min = value
        if maxabsdev < abs(value):
            maxabsdevpos = linecounter
            maxabsdev = abs(value)

ErrorRange = max - min
variance = variance / (float(statcounter) - 1.0)  # Bessel corrected Variance
# variance = variance/(float(statcounter) ) # uncorrected Variance
stddev = math.sqrt(variance)

relvariance = relvariance / (float(statcounter) - 1.0)
relstddev = math.sqrt(relvariance)

# print("N: " + str(statcounter))
# print("MD: " + str(md))
# print("MAD: " + str(mad))
# print("RMS: " + str(rms))
# print("ErrorRange: " + str(ErrorRange))
# print("MAX: " + str(max))
# print("MIN: " + str(min))
# print("AmaxDevAt: " + str(maxabsdevpos))
# print("Var: " + str(variance))

# string_value1 = "%10.3f abc" % float_value

# print("N= " + str(statcounter) + " MD= " + str(md) + " MAD= " + str(mad) + " RMS= " + str(rms) + " ErrorRange= " + str(ErrorRange) + " MAX= " + str(max) + " MIN= " + str(min) + " AmaxDevAt= " + str(maxabsdevpos) + " Var= " + str(variance))

statcounter = "%3d" % statcounter
md = "%6.3f" % md
mad = "%6.3f" % mad
rms = "%10.8f" % rms
ErrorRange = "%6.3f" % ErrorRange
max = "%6.3f" % max
min = "%6.3f" % min
maxabsdev = "%6.3f" % maxabsdev
maxabsdevpos = "%3d" % maxabsdevpos
variance = "%6.3f" % variance
stddev = "%6.3f" % stddev


# rel values in %
relmd = relmd * 100
relmad = relmad * 100
relrms = relrms * 100
relstddev = relstddev * 100
relmaxabsdev = relmaxabsdev * 100
relmd = "%6.3f" % relmd
relmad = "%6.3f" % relmad
relrms = "%6.2f" % relrms
relstddev = "%6.2f" % relstddev
relmaxabsdev = "%6.2f" % relmaxabsdev

if rel == "y":
    print(
        " N= "
        + statcounter
        + " MD= "
        + md
        + " MAD= "
        + mad
        + " RMS= "
        + rms
        + " ErrorRange= "
        + ErrorRange
        + " MAX= "
        + max
        + " MIN= "
        + min
        + " AMAX= "
        + maxabsdev
        + " AmaxDevAt= "
        + maxabsdevpos
        + " Var= "
        + variance
        + " StdDev= "
        + stddev
        + " relMD= "
        + relmd
        + " relMAD= "
        + relmad
        + " "
        + " relSD= "
        + relstddev
        + "  relAMAX "
        + relmaxabsdev
    )
    # print(md + " " + mad + " " + stddev + " " + maxabsdev)
    # print(relmd + " " + relmad + " " + relstddev + " " + relmaxabsdev)
else:
    print(
        " N= "
        + statcounter
        + " MD= "
        + md
        + " MAD= "
        + mad
        + " RMS= "
        + rms
        + " ErrorRange= "
        + ErrorRange
        + " MAX= "
        + max
        + " MIN= "
        + min
        + " AMAX= "
        + maxabsdev
        + " AmaxDevAt= "
        + maxabsdevpos
        + " Var= "
        + variance
        + " StdDev= "
        + stddev
        + " "
    )
