@echo off

:: Convert JPG images to a video

ffmpeg -f image2 -i test-%03d.jpg -r 12 -s 500x250 foo.avi
