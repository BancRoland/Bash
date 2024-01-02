#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# SCRIPT_DIR="/home/szomolaib/Git_Projects/simrad_com"
docker build -t ${USER}_simrad:devcontainer --build-arg USERNAME=${USER} --build-arg USER_UID=$(id -u) $SCRIPT_DIR
