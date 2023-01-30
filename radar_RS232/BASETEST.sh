#!/bin/bash

B=3000
A=$(printf '%.4X\n' $B)
C=${A:(-4)}
D=${$(printf '%.4X\n' $B):(-4)}

echo ${A:(-4)}	#ez a jó

echo ${A:0:4}
echo ${A}

echo $C
echo $D
