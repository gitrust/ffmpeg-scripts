@echo off

:: Convert video to dvd player compatible format

ffmpeg -i %1 -target pal-dvd -ps 2000000000 -aspect 16:9 %2.mpeg