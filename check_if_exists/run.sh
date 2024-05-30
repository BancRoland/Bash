#!/bin/bash

subfolder="myfolder"

if [ -d "$subfolder" ]; then
    echo "Subfolder '$subfolder' exists."
else
    echo "Subfolder '$subfolder' does not exist."
fi

file="dummy.dat"

if [[ -f "$file" ]]; then
    echo "FILE '$file' exists."
else
    echo "FILE '$file' does not exist."
fi
