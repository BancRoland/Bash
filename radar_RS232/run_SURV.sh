#!/bin/bash
DEVICE=$(ls /dev/ttyUSB*)

echo $DEVICE

sudo chmod o+rw $DEVICE
stty ispeed 9600 < $DEVICE
exec 99<>$DEVICE

printf ":2S1\n\r" >&99	#sebességek :2S[0123]	'0': 7deg/sec	'1': 14 deg/sec (default)    '2': 6 deg/sec    '3': 12 deg/sec
printf ":2M01000800\n\r" >&99
read -t 4

#printf ":4V0100\n\r" >&99
#read -t 3
#printf ":4V0000\n\r" >&99

#read "Press ENTER for radiation!"
#printf ":2" >& 99
