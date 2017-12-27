@echo off

:: https://trac.ffmpeg.org/wiki/How%20to%20concatenate%20%28join,%20merge%29%20media%20files
:: join videos using stream copy

set videolist=vidlist.txt
set output=%1

ffmpeg -f concat -i %videolist% -c copy %output%


:: fileformat of vidlist.txt
::# this is a comment
::file '/path/to/file1'
::file '/path/to/file2'
::file '/path/to/file3'