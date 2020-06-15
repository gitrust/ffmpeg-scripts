@echo off

:: Convert video to SVCD compatible format mpeg
:: ntsc (US), rest is PAL TV norm 

ffmpeg -i %1 -target pal-svcd -aspect 16:9 %2.mpg