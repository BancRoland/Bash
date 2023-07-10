#!/bin/bash
# sudo apt-get install fswebcam

# fswebcam -r 1280x720 -d /dev/video2 image.jpg     #for ext.webcam
DATE=`date "+%F_%T"`

mkdir $DATE
cd $DATE

while true
do
    # fswebcam --no-banner --png 0 -r 1280x720 --save image`date "+%F_%T"`.png
    fswebcam --no-banner --png 0 -d /dev/video2 -r 1280x720 --save image`date "+%F_%T"`.png
    sleep 1
done
