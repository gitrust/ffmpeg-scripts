#/bin/bash

# create image with text passed as argument

convert -background black -fill white  -font Tahoma \
          -size 720x576  -pointsize 34  -gravity center \
	 label:"$1"  title.png
