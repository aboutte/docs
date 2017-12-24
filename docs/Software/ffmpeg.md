
ffmpeg -i IMG_2829_cut.mp4 -ss 00:00:00 -t 00:00:48 -async 1 IMG_2829_cut2.mp4

ffmpeg -i IMG_6708.mov -s 640x480 -c:v libx264 -crf 25 -c:a libfaac -movflags faststart IMG_6708_converted.mp4


ffmpeg -i in.mov -vf "transpose=2" out.mov

0 = 90CounterCLockwise and Vertical Flip (default)
1 = 90Clockwise
2 = 90CounterClockwise
3 = 90Clockwise and Vertical Flip
