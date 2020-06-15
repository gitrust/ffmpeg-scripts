@echo off

:: to rotate video taken on a mobile phone

:: transpose=1 90  degree
:: transpose=2 180 degree
:: transpose=3 270 degree

ffmpeg -i %1 -vf transpose=1 %2