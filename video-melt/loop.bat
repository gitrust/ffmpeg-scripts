@echo off

:: loop over avi video files
::
for /f %%f in ('dir /b .\*.avi') do echo ffmpeg -i %%f %%f.mp4
