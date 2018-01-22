@echo off

FFmpeg.exe -i %1 -vn -ar 44100 -ac 2 -ab 128 -f mp3 %2.mp3