#!/bin/bash

ffmpeg -framerate 5 -pattern_type glob -i '*.png' -c:v libx264 -pix_fmt yuv420p output.mp4
