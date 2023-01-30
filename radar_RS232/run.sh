#!/bin/bash

sudo chmod o+rw /dev/ttyUSB0
stty ispeed 9600 < /dev/ttyUSB0
exec 99<>/dev/ttyUSB0

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
