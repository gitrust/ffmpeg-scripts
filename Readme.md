# ffmpeg-scripts

Collection of private batch scripts used for ffmpeg processing (video and audio)



A table describing common FFmpeg video conversion parameters and how their values affect **quality** and **conversion speed**:


| Parameter | Description | Quality (Higher/Lower) | Speed (Faster/Slower) |
| :-- | :-- | :-- | :-- |
| `-crf` | Constant Rate Factor (quality for x264/x265) | Lower value (e.g. 18) = Higher quality, larger file; Higher value (e.g. 28) = Lower quality, smaller file | Lower value = Slower (more data to process); Higher value = Faster |
| `-preset` | Encoding speed/efficiency tradeoff | `veryslow` = Best quality for size; `ultrafast` = Lower quality | `ultrafast` = Fastest; `veryslow` = Slowest |
| `-profile:v` | H.264/H.265 profile (features used) | `high` = Best quality/features; `baseline` = Most compatible, less quality | Minimal impaact |
| `-pix_fmt` | Pixel format (color sampling) | `yuv420p` = Standard for web, good quality; `yuv444p` = Higher quality, less compatible | `yuv420p` = Faster; `yuv444p` = Slower |
| `-b:v` | Video bitrate (CBR) | Higher value = Higher quality | Lower value = Faster (less data); Higher = Slower |
| `-maxrate` | Maximum allowed bitrate (VBR) | Higher value = Potentially higher quality peaks | Lower value = Faster |
| `-bufsize` | Rate control buffer size | Larger buffer = Smoother quality, more consistent | Larger = Slightly slower |
| `-g` | GOP size (distance between I-frames) | Shorter GOP (lower value) = Higher quality for seeking, bigger files | Longer GOP = Faster encoding, smaller files |
| `-c:v` | Video codec (e.g. libx264, libx265) | `libx265` = Better compresion, same quality at lower bitrate | `libx264` = Faster encoding; `libx265` = Slower |
| `-threads` | Number of CPU threads | No direct impact | More threads = Faster encoding (if supported) |
| `-vf` | Video filters (scaling, color, etc.) | Higher quality filters (e.g. `lanczos` scaling) | Simpler filters (e.g. `bilinear`) = Faster |

Further parameters

| Parameter | Description |
| :-- | :-- |
| `-map_metadata` |  to have resulting video files without metadata info use `-1` |


