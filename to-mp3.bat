@echo off

:: Convert given audio to mp3

set INPUT=%1
set OUTPUT=%2
set BITRATE=192

:: avi to mp3
ffmpeg -i "%INPUT%" -vn -ar 44100 -ac 2 -ab %BITRATE% -f mp3 "%OUTPUT%.mp3"