#!/bin/bash
DEVICE=$(ls /dev/ttyUSB*)

echo $DEVICE

sudo chmod o+rw $DEVICE
stty ispeed 9600 < $DEVICE
exec 99<>$DEVICE

printf ":2H0700\n\r" >&99
read -t 4
printf ":2H0900\n\r" >&99
read -t 4
printf ":2H0800\n\r" >&99
read -t 4

printf ":4V0100\n\r" >&99
read -t 3
printf ":4V0000\n\r" >&99

#read "Press ENTER for radiation!"
#printf ":2" >& 99
