#!/bin/bash
DEVICE=$(ls /dev/ttyUSB*)

echo $DEVICE

sudo chmod o+rw $DEVICE
stty ispeed 9600 < $DEVICE
exec 99<>$DEVICE

printf ":2Q\n\r" >&99
printf ":4Q\n\r" >&99

#printf ":4V0100\n\r" >&99
#read -t 3
#printf ":4V0000\n\r" >&99

#read "Press ENTER for radiation!"
#printf ":2" >& 99
