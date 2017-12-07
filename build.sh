#!/bin/bash

docker kill synergy 2> /dev/null
docker build -t synergy .

docker rm synergy 2> /dev/null

USER_NAME=$(id -nu $EXEC_UID)
USER_HOME=$(bash <<< "echo ~$USER_NAME")
docker create -ti \
  --name synergy \
  --net=host \
  -e DISPLAY=$DISPLAY \
  -e EXEC_UID=$(id -u) \
  -v /etc/passwd:/etc/passwd:ro \
  -v $USER_HOME:$USER_HOME \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  synergy
