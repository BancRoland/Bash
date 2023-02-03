#!/bin/bash
DEVICE=$(ls /dev/ttyUSB*)

echo $DEVICE

cat -v $DEVICE &

sudo chmod o+rw $DEVICE
stty ispeed 9600 < $DEVICE
exec 99<>$DEVICE


read -t 1

cat -v <&99 &

printf ":2HPOS\n\r" >&99
read -t 4
read answer <&99 &
echo $answer
read -t 4

printf ":2H0700\n\r" >&99
read <&99
read -t 4

printf ":2H0900\n\r" >&99
read -t 4

printf ":2HPOS##\n\r" >&99

#printf ":4V0100\n\r" >&99
#read -t 3
#printf ":4V0000\n\r" >&99

#read "Press ENTER for radiation!"
#printf ":2" >& 99
