@echo on

:: compress audio to mp3 with given audio bitrate
::

:: choose audio bitrate:

:: 96kbps
:: 112kbps
:: 128kbps
:: 160kbps
:: 192kbps
:: 256kbps
:: 320kbps

ffmpeg -i %1 -ab 128 %2.mp3
