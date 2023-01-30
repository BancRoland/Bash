#!/bin/bash
DEVICE=$(ls /dev/ttyUSB*)

echo $DEVICE

sudo chmod o+rw $DEVICE
stty ispeed 9600 < $DEVICE
exec 99<>$DEVICE

printf ":4V03E0\n\r" >&99	#90 fokos eleváció
