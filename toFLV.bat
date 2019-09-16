@echo off

:: avi to flv
set INPUT=%1
set OUTPUT=%2

ffmpeg -i "%INPUT%" -ab 56 -ar 44100 -b 200 -r 15 -s 320x240 -f flv "%OUTPUT%.flv"