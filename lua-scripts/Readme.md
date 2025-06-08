# lua-scripts

Every now and then I convert my archived digital DV tapes. 
I use Lua for this task. With its lightweight interpreter, it was predestined for the small conversion task.

Also all videos from my panasonic cam needed to be deinterlaced during that process.
For that purpose I used a ffmpeg filter

```
-filter:v "bwdif=mode=send_field:parity=auto:deint=all"
```


## convert.lua

I needed it to covert a bunch of AVI files to MP4 format.
All source files had a special file format containing the recording date.
I parsed and preserved it as metadata in each MP4 file using a ffmpeg parameter.

## guess-duration.lua

A helper script to get know the conversion time before processing a folder with many video files.
I calculated the `guess factor` by processing one small video. And then devided the processing time
through video length. Of course the guess factor could be different for each video extension and depends
from the hardware one uses.