#!/bin/bash
# sudo apt-get install fswebcam

# fswebcam -r 1280x720 -d /dev/video2 image.jpg     #for ext.webcam
# fswebcam -r 1280x720 image.jpg
# fswebcam --no-banner --png 0 -r 1280x720 --save image.png
# fswebcam --no-banner --png 0 -r 1280x720 -d /dev/video2 -S 10 -D 0 -F 10 --save image.png     #for ext.webcam dell laptop
fswebcam --no-banner --png 0 -r 1280x720 -d /dev/video0 -S 10 -D 0 -F 10 --save image.png     #for for kuvik
