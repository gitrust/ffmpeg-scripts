@echo off

::
:: Create high quality gif from image sequence
::
:: image format:   image-001.jpg

:: first, create palette
ffmpeg -f image2 -i img-%%03d.jpg -vf scale=400:-1:sws_dither=ed,palettegen palette.png

:: intermediate video
ffmpeg.exe -f image2 -framerate 5 -i img-%%03d.jpg video.flv

:: final result gif
ffmpeg.exe -i video.flv -framerate 5 -i palette.png -filter_complex "scale=400:-1:flags=lanczos[x];[x][1:v]paletteuse" video.gif