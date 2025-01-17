ascii-sum
=========

Bash script using GDAL to sum all ascii grids in a directory. If these ascii grids represent species distribution models, this script can be used to produce a grid representing an index of "species richness". 

Requires GDAL. To install GDAL (Ubuntu 12.04):  
```bash
$ sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable
$ sudo apt-get update
$ sudo apt-get install libgdal-dev gdal-bin
```

Next, create a file called "init.tif" that is the same size, dimensions and resolution as the input species distribution models, with all values set to 0 (no data values can be kept unchanged). In QGIS this is simple; use the grid calculator to multiply one of the species distribution ascii grids by 0, then export the result to geotiff.

Finally, copy the shell script ascii-sum.sh to the folder containing the species distribution ascii grids.

Run on the command line with:  
```bash
$ bash ascii-sum.sh
```

The result will be called "out.tif". For continuous species distribution models (produced by MaxEnt for example) this result can be considered an index of "habitat richness", with higher values representing a higher quantity of suitable habitat for the included set of species. For thresholded models, this script will produce a count of all species found in each location. 
