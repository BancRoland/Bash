#!/bin/bash

docker build -t my-docker .
docker run -it --name cont_name my-docker

docker ps -a    # list containers
docker rm your-container-name   # remove container

docker exec -it cont_name /bin/bash
docker start 63a871f99bfc
docker stop 63a871f99bfc