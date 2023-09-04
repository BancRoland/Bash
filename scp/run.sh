#!/bin/bash



FOLDER=/home/roland/Desktop/kuvik/ads-b/log/raw
FILE=/home/roland/Desktop/kuvik/ads-b/log/raw
IP="192.168.1.2"
user=kuvik
DEST=~/Desktop
# scp -r $FOLDER $USER@$IP:$DEST
scp $FILE $USER@$IP:$DEST