#!/bin/sh

. ./env-vars.sh

./build-volume.sh

./build-network.sh

docker build -t ${DOCKER_MANTAINER_NAME}/${DOCKER_NAME} .
