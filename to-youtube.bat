@echo off

:: convert video to youtube mkv format

:: youtube setting with audio copy
ffmpeg -i "%1" -c:v libx264 -preset slow -crf 18 -c:a copy -pix_fmt yuv420p "%2.mkv"