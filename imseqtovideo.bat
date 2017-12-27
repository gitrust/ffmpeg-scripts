@echo off

:: Convert  a png image sequence to a MP4 video


ffmpeg -i %%04d.png -c:v libx264 -r 30 -pix_fmt yuv420p %1.mp4
