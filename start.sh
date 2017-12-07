#!/bin/bash

USER_NAME=$(id -nu $EXEC_UID)
USER_HOME=$(bash <<< "echo ~$USER_NAME")

docker kill synergy > /dev/null
docker rm synergy > /dev/null
docker create -ti --privileged --cap-add=ALL \
  --name synergy \
  --net=host \
  -e DISPLAY=$DISPLAY \
  -e EXEC_UID=$(id -u) \
  -v /etc/passwd:/etc/passwd:ro \
  -v $USER_HOME/.Xauthority:/root/.Xauthority \
  -v $USER_HOME:$USER_HOME \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  synergy
