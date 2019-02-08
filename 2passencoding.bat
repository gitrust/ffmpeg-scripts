@echo off

ffmpeg -y -i %1 -c:v mpeg4 -vtag xvid -b:v 2200k -pass 1 -an -f avi NUL
ffmpeg -y -i %1 -c:v mpeg4 -vtag xvid -b:v 2200k -pass 2 -c:a libmp3lame -b:a 128k output.avi