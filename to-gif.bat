@echo off

::
:: Create high quality gif from image sequence
::
:: Took parameters from
:: https://medium.com/@colten_jackson/doing-the-gif-thing-on-debian-82b9760a8483
::

set OUTPUT=image.gif
:: image format:   image-0001.png
set INPUT=video.avi
set PARAMS=fps=10,scale=400:-1
set TIME_PARAMS=-ss 1:35 -t 4
set PALETTE=palette.png

:: generate a custom color palette
ffmpeg %TIME_PARAMS% -i %INPUT%  -vf  "%PARAMS%:flags=lanczos,palettegen" %PALETTE%


:: generate final gif
ffmpeg  %TIME_PARAMS% -i %INPUT% -i %PALETTE% -filter_complex "%PARAMS%:flags=lanczos[x];[x][1:v]paletteuse" %OUTPUT%

rm %PALETTE%