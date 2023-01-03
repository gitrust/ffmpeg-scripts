@echo off

::
:: Converts a mp4 file to mkv losslessly
::

setlocal
set INPUT=%1

ffmpeg -i "%INPUT%" -vcodec copy -acodec copy "%INPUT%.mkv"

endlocal