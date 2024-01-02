#!/bin/bash

dockName=simrad_dock
imgName=${USER}_simrad:devcontainer
UID=$(id -u)
echo $UID

# docker build --no-cache --ssh default --build-arg USERNAME=${USER} --build-arg USER_UID=$UID -t $imgName .
docker build --ssh default --build-arg USERNAME=${USER} --build-arg USER_UID=$UID -t $imgName .
docker run -t -i --device=/dev/bus/usb -p 1234:1234 --name $dockName $imgName
