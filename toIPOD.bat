ffmpeg -i INPUT -acodec libfaac -ab 128k -s 320x240 -vcodec libx264 -vpre hq -vpre ipod320 -b 700k -bt 700k -metdata "title=SOME_TITLE" -threads 0 -f ipod OUTPUT.mp4

rem C:\Daten\Downloads\ffmpeg\ffmpeg -i %1 -f mp4 -r 25 -s 320×240 -b 768000 -ac 2 -ar 44000 -vol 400 -ab 112000 %1.mp4