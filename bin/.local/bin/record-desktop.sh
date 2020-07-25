#!/bin/bash
# Small script to record my desktop + audio using ffmpeg
#
# https://www.pcsuggest.com/linux-screen-recorder-ffmpeg/

if [ "$1" == "start" ]; then
    cd ~/Videos
    # Start webcam
    # ffplay -f video4linux2 -i /dev/video0 -video_size 320x240 &

    # Record screen
    OUTPUT_FILE="$(date +"%c" | tr A-Z' ' a-z'_').mkv"
    ffmpeg \
        -f alsa -i hw:0 \
        -f x11grab -r 25 -s 1920x1080 -i :0.0 -vcodec libx264 $OUTPUT_FILE
        # -f x11grab -r 25 -s 1920x1080 -i :0.0+1920 -vcodec libx264 $OUTPUT_FILE
elif [ "$1" == "stop" ]; then
    pkill ffmpeg
else
    echo -e "Usage: $0 start|stop"
fi
