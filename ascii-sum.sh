#!/bin/bash

# ASCII-SUM.SH
# DESCRIPTION
# loops through all ascii files in a folder and appends to out.tif
# TO RUN: $ bash ascii-sum.sh
# REQUIREMENTS:
#   1. set of ascii grids in a folder
#   2. init.tif: geotiff in same extent and resolution as inputs files but with all 0 values

# copy init.tif to out.tif. init is a tif of same extent as ascii with all 0 values
# this copy keeps init.tif for use the next time
cp init.tif out.tif

# loop through all ascii files in the folder and add them to the out.tif file
for FILE in *.asc
do
  echo $FILE
  gdal_calc.py -A $FILE -B out.tif --outfile=out.tif --calc="A+B"
done
