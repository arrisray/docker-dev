#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker build \
    -t arris/dev:latest \
    --build-arg USER=`whoami` \
    --build-arg GROUP=`id -gn $USER` \
    --build-arg UID=`id -u` \
    --build-arg GID=`id -g` \
    $DIR
