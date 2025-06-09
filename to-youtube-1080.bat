@echo off

set INPUT=%1
set OUTPUT=%2

:: Youtube Conversion, high quality
::
:: 1080p video
:: 
:: CRF: 18 (high quality)
:: B-Frames: 2 (higher quality, better compression)
:: preset: slow (high quality, small filesize)
:: -movflags +faststart (faster streaming)
ffmpeg -i %INPUT% -c:v libx264 -profile:v high ^
    -crf 18 -preset slow -pix_fmt yuv420p -bf 2 -g 30 ^
    -c:a aac -b:a 192k -ac 2 -ar 48000 ^
    -movflags +faststart -use_editlist 0 ^
    %OUTPUT%.mp4
