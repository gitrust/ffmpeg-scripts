@echo off

:: avi to flv
ffmpeg -i %1 -ab 56 -ar 44100 -b 200 -r 15 -s 320x240 -f flv %2.flv