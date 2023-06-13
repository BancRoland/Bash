#!/bin/bash
DES="2023.06.10. 12:05:00"
DATE=$(date +"%Y.%m.%d. %H:%M:%S")
echo $DATE

if [[ $DATE > "20:50:00" ]]; then
    echo cica
else
    echo kutya
fi

while true
do
NOW=$(date +"%Y.%m.%d %H:%M:%S")
echo time now: $NOW
echo later than $DES?

if [[ $NOW > $DES ]]; then
    bash pinger.sh
fi
sleep 1

done
