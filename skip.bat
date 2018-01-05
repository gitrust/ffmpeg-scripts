@echo off

:: Skip video using time specification

::
set input=%1
set output=%2

:: skip first 10 seconds
ffmpeg  -i %input% -ss 00:00:10 -c copy %output%