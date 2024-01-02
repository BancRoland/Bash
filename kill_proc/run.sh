#!/bin/bash

# Get the list of PIDs for processes matching the specified name
pids=$(ps aux | grep 'GPSrec.py' | awk '{print $2}')

# Check if any processes were found
if [ -n "$pids" ]; then
    echo "Killing processes with name GPSrec.py:"
    echo "$pids"
    
    # Kill each process
    for pid in $pids; do
        kill "$pid"
    done
else
    echo "No processes found with name GPSrec.py"
fi
