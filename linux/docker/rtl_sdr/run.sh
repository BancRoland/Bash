#!/bin/bash

docker build -t sdr_docker .
docker run -it --device=/dev/bus/usb --name sdr_cont sdr_docker

