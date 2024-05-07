#!/bin/bash

# Start the process in the background
bash time.sh &

# Capture the process ID (PID) of the background process
pid=$!

# Sleep for 30 seconds
sleep 5

# Kill the process using the captured PID
kill $pid

# Optionally, you can print a message after killing the process
echo "Process killed after 30 seconds."
