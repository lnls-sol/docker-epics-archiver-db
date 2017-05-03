#!/bin/bash

. ./env-vars.sh

CONTAINERS=$(docker ps -a | grep ${DOCKER_RUN_NAME})

if [ ! -z "$CONTAINERS" ]; then
    docker stop ${DOCKER_RUN_NAME}
    docker rm ${DOCKER_RUN_NAME}
fi

docker run -d --name=${DOCKER_RUN_NAME} -e MYSQL_USER=${MYSQL_USER} -d \
    -e MYSQL_PASSWORD=${MYSQL_PASSWORD} -e MYSQL_DATABASE=${MYSQL_DATABASE} \
    -e MYSQL_ROOT_PASSWORD,="controle" -p ${MYSQL_PORT}:${MYSQL_PORT} --network=${NETWORK_ID} \
    --volumes-from=${DOCKER_VOLUME_NAME} ${DOCKER_MANTAINER_NAME}/${DOCKER_NAME}


