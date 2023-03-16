#!/bin/bash

adddate() {
    while IFS= read -r line; do
        printf '%s %s\n' "$(date "+%H:%M:%S.%3N")" "$line";
    done
}


bash stream.sh | adddate