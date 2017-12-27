@echo off

:: avi to mp3
ffmpeg -i son_origine.avi -vn -ar 44100 -ac 2 -ab 192 -f mp3 %2.mp3