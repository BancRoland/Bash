#!/bin/bash
DES="20:27:00"
DATE=$(date +%H:%M:%S)
echo $DATE

if [[ $DATE > "20:50:00" ]]; then
    echo cica
else
    echo kutya
fi

while true
do
NOW=$(date +%H:%M:%S)
echo time now: $NOW
echo later than $DES?

if [[ $NOW > $DES ]]; then
    echo yes
else
    echo no
fi
sleep 1

done
