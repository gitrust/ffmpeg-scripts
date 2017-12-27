@echo off

:: Cut video starting at start and with given duration
::
set file=%1
set start=%2
set duration=%3
set out=%4

set end=%3
set neg=-avoid_negative_ts 1

:: to cut from start
ffmpeg -i %file% -ss %start% -c copy  %out%

:: to cut from a start to an endpoint
::ffmpeg -i %file% -ss %start% -c copy -t %duration%   %neg% %out%


:: ignore everything  after the first 35 seconds
::ffmpeg -i input.wmv -c copy -t 35 output.wmv
