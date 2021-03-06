#!/bin/bash

VOLUME_HOME=/data/issdl2020/home

mkdir -p $VOLUME_HOME

docker run \
    --hostname=DLHub \
    -v $VOLUME_HOME:/home/ \
    -p 443:8000 \
    -p 80:80 \
    -p 9000-9500:9000-9500 \
    -ti dlhub/hub $@
