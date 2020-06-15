@echo off

:: to fix video keyframes copy both audio/video to a new file

ffmpeg -i %1 -c:v copy -c:a copy %2