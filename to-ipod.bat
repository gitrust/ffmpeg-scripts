@echo off

:: Converts video to iPOD compatible format

setlocal
set INPUT=%1
set TITLE="video title"

ffmpeg -i "%INPUT%" -acodec libfaac -ab 128k -s 320x240 -vcodec libx264 -vpre hq -vpre ipod320 -b 700k -bt 700k -metadata "title=%TITLE%" -threads 0 -f ipod "%INPUT%.mp4"

endlocal