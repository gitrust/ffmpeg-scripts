@echo off

set INPUT=%1
set OUTPUT=%2

ffmpeg -i "%INPUT%" -f mp4 -vcodec libx264 -preset medium -profile:v main -acodec aac "%OUTPUT%" -hide_banner