@echo off

set dir1=.

FOR %%n in (%dir1% *.wma) DO  ffmpeg -i "%%n" -ab 128k  "new\%%~nn.mp3" 