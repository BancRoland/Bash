#!/bin/bash

adddate() {
    while IFS= read -r line; do
        printf '%s %s\n' "$(date "+%Y.%m.%d %H:%M:%S")" "$line";
        
    done
}

bash stream.sh | adddate