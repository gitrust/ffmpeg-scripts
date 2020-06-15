@echo on

:: convert Video to divx format
::
ffmpeg -i %1 -s 320x240 -aspect 4:3 -ar 44100 -ac 2 -vcodec libxvid -sameq -acodec libmp3lame -sameq %2.avi
