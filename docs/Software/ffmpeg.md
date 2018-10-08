# ffmpeg 

# Cut video

    ffmpeg -i IMG_2829_cut.mp4 -ss 00:00:00 -t 00:00:48 -async 1 IMG_2829_cut2.mp4

# Convert and reduce size

    ffmpeg -i IMG_4674.m4v -s 480x640 -c:v libx264 -crf 25 -c:a aac -movflags faststart IMG_4674_converted.mp4


## Rotate

    ffmpeg -i in.mov -vf "transpose=2" out.mov

- 0 = 90CounterCLockwise and Vertical Flip (default)
- 1 = 90Clockwise
- 2 = 90CounterClockwise
- 3 = 90Clockwise and Vertical Flip
