.PHONY: video
# use smtpplayer for time management
# use current ffmpeg tool!

film:=christmas.avi
output=out.avi

file:=$(film)
par:=-avoid_negative_ts 1
ffmpeg:=ffmpeg.exe -fflags +genpts
ff:=ffmpeg
join:=join.txt


INPUT:=input.mpg.mp4
OUT:=output.mp4

#$(ffmpeg)   -ss 00:00:16 -i "$(file)"   -t 24  -c copy $(par) f1.avi
cut:
	$(ffmpeg)  -ss 2 -t 00:10:00  -i "$(file)"   -c copy $(par) f1.avi

joinlist:
	@echo file 'f1.avi' > $(join)
	@echo file 'f2.avi' >> $(join)
	@echo file 'f3.avi' >> $(join)
	
all: clear
	make cut
	make joinlist
	make join
	
clear:
	rm -f f*.avi $(join)
	rm -f $(output)

# geht , versuchen die constant-bitrate runterzuschrauben 
mpeg2:
	${ff}  -i ${INPUT} -codec:v mpeg2video  -qscale:v 2 -codec:a mp2 -b:a 192k mpeg2.mpg
	
join:
	$(ffmpeg) -f concat -i $(join) -c copy $(output)

# search and cut and the beginning (key-frame)
cut-front:
	echo d
	${ff} -ss 00:06:18 -i ${INPUT} -c copy   ${OUT}

# search and cut at the end of video
cut-end:
	${ff} -ss 00:00:00 -i ${INPUT} -to 08:42:00 -c copy   ${OUT}
	
divx5:
	${ff} -i ${INPUT} -f avi -vcodec mpeg4 -vtag divx -b 800 -g 300 -bf 2 -acodec mp3 -ab 128 divx5.avi
	
divx:
	${ff} -i ${INPUT} -vcodec mpeg4 -b 600000  -vtag DX50 -ar 44100 -ab 128 -ac 2 -acodec mp3 divx.avi

xvid:
	${ff} -i ${INPUT} -c:v mpeg4 -vtag xvid -b:v 750k -qscale:v 3 -c:a libmp3lame -qscale:a 4 xvid.avi

mp4:
	${ff} -i ${INPUT} -c:v libx264 -preset medium -b:v 555k  -c:a libmp3lame -b:a 128k mp4.mp4
 
# geht, aber kein ton 
dvd:
	${ff} -i ${INPUT} -target pal-dvd -ps 2000000000 -aspect 16:9 dvd.mpeg

wmv:
	${ff} -i ${INPUT}  -b:v 2M -vcodec msmpeg4 -acodec wmav2 wmv.wmv
 
# geht aber schlechte quali 
vcd:
	${ff} -i ${INPUT} -target pal-vcd -aspect 16:9 vcd.mpg
    
svcd:
	${ff} -i ${INPUT} -target pal-svcd  svcd.mpg 

# use for DVD player 
svcd2:
	${ff} -i "${INPUT}" -target pal-svcd -s 720x576 svcd2.mpg
    
svcd-ntsc:
	${ff} -i ${INPUT} -target ntsc-svcd -aspect 16:9 svcd-ntsc.mpg 
    

cut2:    
	${ff} -i ${INPUT} -ss 00:50:00 -c copy -t 25  cut-${INPUT}

divx2:
	${ff}  -i ${INPUT} -s 720x576 -vcodec msmpeg4v2 divx2.avi

#mpegdvd
mpeg-dvd:
	${ff}  -i ${INPUT} -s 720x576 -b:v 700k -vcodec mpeg2video -acodec mp3 mpeg-dvd.mpg

# suitable to play on android devices, good quality
# tutor: https://www.virag.si/2012/01/web-video-encoding-tutorial-with-ffmpeg-0-9/
android:
	${ff} -i  ${INPUT} -codec:v libx264 -profile:v high -preset slow -b:v 500k -maxrate 500k -bufsize 1000k -vf scale=-1:480 -threads 0 -codec:a libvo_aacenc -b:a 128k  android.mp4
    
all-decode: xvid dvd svcd svcd-ntsc vcd mp4 divx wmv mpeg-dvd divx2 mpeg2
