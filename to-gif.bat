@echo off

::
:: Create high quality gif
::
:: Took parameters from
:: https://medium.com/@colten_jackson/doing-the-gif-thing-on-debian-82b9760a8483
::

set INPUT=%1
set OUTPUT=%INPUT%.gif
set TIME_PARAMS=-ss 0:01 -t 4

:: generate final gif without intermediate palette image
ffmpeg  %TIME_PARAMS% -i %INPUT% -vf "fps=10,scale=300:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" %OUTPUT%
