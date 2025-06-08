# video melt

The `faderloop.sh` loops through a directory with video files and

- generates a title image for the final video reading `title.txt` from processing directory

The `fader.sh`

- generates a title video from title image
- concats the title video and the AVI videos from same folder
- puts a video fade filter for transition 

Resulting video in each subfolder shows a title and videos from that folder combined into one file

# Used tools

- melt
- convert
- ffmpeg