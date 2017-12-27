#!/bin/bash

# create an image with text passed as argument

convert -background black -fill white  -font Tahoma \
          -size $title_size  -pointsize 34  -gravity center \
         label:"$1"  text.png
