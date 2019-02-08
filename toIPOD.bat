@echo off

ffmpeg -i INPUT -acodec libfaac -ab 128k -s 320x240 -vcodec libx264 -vpre hq -vpre ipod320 -b 700k -bt 700k -metdata "title=SOME_TITLE" -threads 0 -f ipod OUTPUT.mp4