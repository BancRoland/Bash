#!/bin/bash

# ant laptop
ping 10.97.25.83
ssh ant@10.97.25.83
scp -r ant@10.97.25.83:/home/ant/Pictures/Screenshots .

# Freyja
ping 10.97.24.179
ssh marositsa@10.97.24.179 -p 22201
