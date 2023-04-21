#!/bin/bash

for i in *
do
    # echo ${i%.*}
    # echo ${i#*.}
    # echo ${i##*.}
    # echo ${i/*./something}
    echo ${i#*.}
done