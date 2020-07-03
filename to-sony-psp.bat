@echo off

:: Convert video to a Sony PSP compatible format

ffmpeg -i %1 -b 300 -s 320x240 -vcodec xvid -ab 32 -ar 24000 -acodec aac output.mp4