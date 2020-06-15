@echo off

:: convert each audio in given directory to mp3

set dir1=.

:: extension of source audio
set ext=*.wma

FOR %%n in (%dir1% %ext%) DO  ffmpeg -i "%%n" -ab 128k  "new\%%~nn.mp3" 