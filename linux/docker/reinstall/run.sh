#!/bin/bash

mkdir .ssh
# cp ~/.ssh/* ./.ssh

docker build -t reinstall_image .
docker run -it --name reinstall_docker reinstall_image

# docker ps -a    # list containers
# docker rm your-container-name   # remove container

# docker exec -it cont_name /bin/bash
# docker start 63a871f99bfc
# docker stop 63a871f99bfc