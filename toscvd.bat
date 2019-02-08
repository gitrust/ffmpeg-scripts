@echo off

:: ntsc (US), rest is PAL TV norm 

ffmpeg -i %1 -target pal-svcd -aspect 16:9 %2.mpg