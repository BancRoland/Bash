#!/bin/bash

## FOR TH PICTURES
# mkdir pics
# python3 picgen.py

## FOR THE NAIVE SOLUTION (COLORS ARE OFF)
ffmpeg -pattern_type glob -i 'pics/fig_*.png' video0.gif

## FOR COLOR CORRECTION WE USE PALETTE
ffmpeg -pattern_type glob -i 'pics/fig_*.png' -vf palettegen palette.png
ffmpeg -pattern_type glob -i 'pics/fig_*.png' -i palette.png -lavfi paletteuse video1.gif
# rm palette.png

ffmpeg -framerate 5 -pattern_type glob -i 'pics/fig_*.png' -i palette.png -lavfi paletteuse video2.gif