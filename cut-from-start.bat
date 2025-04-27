@echo off

:: Cut video starting at start
::
set file=%1
set start=%2
::set end=%3
set output=%3
set neg=-avoid_negative_ts 1

:: Timestamps are unset in a packet for stream 0. Deprecated?
:: workaround:
:: -fflags +genpts

:: to cut from start
:: timeformat :  HH:MM:ss
ffmpeg -i "%file%" -fflags +genpts -ss %start%  -c copy %neg%  "%output%"
