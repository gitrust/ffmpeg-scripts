#!/bin/bash

# melt frame length for transition
frame_len=30
# laenge in sek
title_len=3
title_size=720x576
title1="$(sed -n 1p title.txt)"
title2="$(sed -n 2p title.txt)"
filename=$1

#cleanup
rm -f title.mp4
rm -f title.png
rm -f ${filename}.avi

# create title png
#convert -background black -fill white  -font Tahoma \
#          -size $title_size  -pointsize 34  -gravity center \
#	 label:"$1"  title.png

# text over 2 lines
pangotext="<span size='50000' rise='-150000' foreground='white' background='black'>$title1</span>\n<span size='20000' rise='-160000' foreground='white'>${title2}</span>"
convert -background black -pointsize 20 -size $title_size -gravity center pango:"$pangotext"  title.png

# create title video called title.mp4  in working directory
ffmpeg -loop 1 -i title.png  -vcodec libx264 -strict experimental -b:a 192k -t $title_len  title.mp4

# melt command
x=" title.mp4 -mix $frame_len -mixer luma "

# melt processing all .avi files in given directory (fading)
for i in *.avi
do
	x="$x $i -mix $frame_len -mixer luma "
done

# melt command 
x="melt$x  -filter avdeinterlace -consumer avformat:${filename}.avi vcodec=libxvid b=5000k acodec=aac ab=128k"

eval $x
