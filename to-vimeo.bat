@echo off

set INPUT=%1
set OUTPUT=%2

:: VIMEO Converter

:: Container: mp4
:: High Quality
:: Constant Rate
:: -map_metadata -1 (remove metadata)

ffmpeg -i %INPUT% ^
    -c:v libx264 -profile:v high -preset slow -crf 20 -pix_fmt yuv420p ^
    -g 30 -maxrate 5500k -bufsize 15000k -s 1920x1080 ^
    -c:a aac -b:a 192k -ac 2 -ar 48000 ^
    -movflags +faststart -map_metadata -1 ^
    %OUTPUT%.mp4
