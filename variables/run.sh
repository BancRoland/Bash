#!/bin/bash

a=$(date)
echo $a     #2023. márc. 11., szombat, 15:14:33 CET

b="date \"+%Y\""
echo $b     #date "+%Y"
echo $(eval $b)     #2023

c=$(eval $b)
echo $c     #2023
