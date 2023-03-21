#!/bin/bash

# str="a13_56_4x0.bin"
str=$( eval "ls *.bin" )
echo $str
arr=( ${str//[!0-9]/ } )
echo ${arr[0]}
echo ${arr[1]}
echo ${arr[2]}
echo ${arr[3]}