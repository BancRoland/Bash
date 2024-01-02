#!/bin/bash

dockName=simrad_dock
imgName=simrad_img

docker rm $dockName
docker rmi $imgName:latest