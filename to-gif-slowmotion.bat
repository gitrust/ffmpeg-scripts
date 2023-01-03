@echo off

::
:: Create high quality gif from image sequence
::
:: image format:   img-001.jpg
:: 

setlocal
set INPUT=img-%%03d.jpg
set OUTPUT=video.gif
set TMP_VIDEO=video.mp4
set PALETTE=palette.png

:: first, create palette
ffmpeg -f image2 -i "%INPUT%" -vf scale=400:-1:sws_dither=ed,palettegen %PALETTE%

:: intermediate video
ffmpeg -f image2 -framerate 5 -i "%INPUT%" %TMP_VIDEO%

:: final result gif
ffmpeg -i %TMP_VIDEO% -framerate 5 -i %PALETTE% -filter_complex "scale=400:-1:flags=lanczos[x];[x][1:v]paletteuse" %OUTPUT%
endlocal