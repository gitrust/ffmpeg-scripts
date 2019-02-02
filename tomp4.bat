@echo off


ffmpeg -i %1 -f mp4 -vcodec libx264 -preset medium -profile:v main -acodec aac %2 -hide_banner