@echo off

:: Copy video while skipping a part of it using time specification

::
set input=%1
set output=%2

:: skip first 10 seconds
ffmpeg  -i %input% -ss 00:00:10 -c copy %output%