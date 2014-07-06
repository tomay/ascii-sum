#!/bin/bash

# loops through all ascii files in a folder and appends to out.tif
# example - add two files together
#gdal_calc.py -A Belenois_antsianaka.asc -B Belenois_creona.asc --outfile=result.asc --calc="A+B"

# cp init to out.tif. init is a tif of same extent as ascii with all 0 values
# this copy keeps init.tif for use the next time
cp init.tif out.tif

# loop through all ascii files in the folder and add them to the out.tif file
for FILE in *.asc
do
  echo $FILE
  gdal_calc.py -A $FILE -B out.tif --outfile=out.tif --calc="A+B"
done
