@echo off

:: Convert given audio to mp3

setlocal
set INPUT=%1
set BITRATE=192

:: avi to mp3
ffmpeg -i "%INPUT%" -vn -ar 44100 -ac 2 -ab %BITRATE% -f mp3 "%INPUT%.mp3"
endlocal