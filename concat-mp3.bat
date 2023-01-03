@echo off

:: Concat multiple mp3 files into one 
::
:: Example call:  concat-mp3.bat *.mp3


setlocal
set OUTPUT="concat.mp3"

for  %%a in (%1) do call set "FILELIST=%%FILELIST%%|%%a"
::echo "%FILELIST:~1%"

:: :~1 removes the first pipe character
ffmpeg -i "concat:%FILELIST:~1%" -acodec copy %OUTPUT%

endlocal