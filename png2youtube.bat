@echo off

:: example images/%03d.png
ffmpeg -r 24 -i %1 -s:v 1280x720 -c:v libx264 -profile:v high -crf 23 -pix_fmt yuv420p -r 30 video.mp4