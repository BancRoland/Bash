#!/bin/bash
DEVICE=$(ls /dev/ttyUSB*)

sudo chmod o+rw $DEVICE
stty ispeed 9600 < $DEVICE
exec 99<>$DEVICE

echo "Press ENTER for radiation!"
read
printf ":3I\n\r" >& 99
read -t 1
printf ":3P0\n\r" >& 99
read -t 1
printf ":3P3\n\r" >& 99

echo "Press ENTER to STOP radiation!"
read

printf ":3P0\n\r" >& 99
