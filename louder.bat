@echo off

:: make sound louder
:: the volume is relative: volume * input-volume

::ffmpeg -i input.wav -af 'volume=0.5' output.wav

ffmpeg -i %1 -af 'volume=2.0' %2