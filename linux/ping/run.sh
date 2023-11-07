#!/bin/bash

rm log.txt
for ((i=0; i<256; i++))
do
    echo $i
    ping -c 1 -W 0.1 192.168.0.$i | grep "bytes from" | tee -a log.txt
done