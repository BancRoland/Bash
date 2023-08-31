#!/bin/bash

echo "Press Enter to get the current time..."
read

current_time=$(date +"%Y.%m.%d. %H:%M:%S")
unix_time=$(date +"%s")
echo "Current time: $current_time"
echo "Current unix time: $unix_time"