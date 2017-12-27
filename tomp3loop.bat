@echo off
set dir1=.

:: FOR %%n in (%dir1% *.*) DO ffmpeg -i "%%n" -ab 128k "neu\%%n.mp3" 
FOR %%n in (%dir1% *.wma) DO  ffmpeg -i "%%n" -ab 128k  "neu\%%~nn.mp3" 