@echo off

:: extract input media to audio mp3

ffmpeg -i %1 -vn -ar 44100 -ac 2 -ab 128 -f mp3 %2.mp3