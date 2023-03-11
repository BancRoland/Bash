#!/bin/bash

a=$(date "+%s%N")
echo $a
while true
do
    sleep 1
    b=$(date "+%s%N")
    echo $(( ($b - $a)/1000000 )) milliseconds have passed
done