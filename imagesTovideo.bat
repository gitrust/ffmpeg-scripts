@echo off

:: Convert JPG images `image-001.jpg` to a video

ffmpeg -f image2 -i image-%03d.jpg -r 12 -s 500x250 video.avi
