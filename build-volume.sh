#!/bin/bash

. ./env-vars.sh

# Create volume container
DOCKER_DATA_CONTAINERS=$(docker ps -a | grep ${DOCKER_VOLUME_NAME})

if [ -z ${DOCKER_DATA_CONTAINERS:+x} ]; then
    docker create -v ${MYSQL_DATA} --name ${DOCKER_VOLUME_NAME} mysql
fi
