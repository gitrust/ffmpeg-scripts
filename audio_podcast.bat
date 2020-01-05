@echo off

set AUDIO=%1
set IMAGE=input.png
set VIDEO=video.mkv

:: Create a video with a still image and an audio file
ffmpeg -loop 1 -framerate 2 -i %IMAGE% -i %AUDIO% -c:v libx264 -preset medium -tune stillimage -crf 18 -c:a copy -shortest -pix_fmt yuv420p %VIDEO% 

