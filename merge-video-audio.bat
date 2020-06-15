@echo off

::
:: Merge audio and video
:: Argument 1: Video
:: Argument 2: Audio 

set FFMPEG=ffmpeg.exe

:: if video already contains audio -> comment out
set MAPOPTIONS=-map 0:v -map 1:a
set OUTPUT=video.mp4

%FFMPEG% -i %1 -i %2 %MAPOPTIONS% -codec copy -shortest %OUTPUT%