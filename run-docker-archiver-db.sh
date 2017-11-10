#!/bin/bash

#
# An auxiliary script to start a new Docker container. It should be used to test the 
# respective image. To deploy, use the composed repository, available in
# https://github.com/lnls-sirius/docker-epics-archiver-composed .  
#
# Gustavo Ciotto Pinton
# Controls Group - Brazilian Synchrotron Light Source Laboratory - LNLS
#

. ./env-vars.sh

# Verifies if a container with the same name is already running.
CONTAINERS=$(docker ps -a | grep ${DOCKER_RUN_NAME})

if [ ! -z "$CONTAINERS" ]; then

    echo "A container with the name ${DOCKER_RUN_NAME} is already running..."

    # Stops running container and deletes it.
    echo "Executing 'docker stop ${DOCKER_RUN_NAME}' ..."
    docker stop ${DOCKER_RUN_NAME} &> /dev/null

    echo "Executing 'docker rm ${DOCKER_RUN_NAME}' ..."
    docker rm ${DOCKER_RUN_NAME} &> /dev/null
fi

docker run -d --name=${DOCKER_RUN_NAME} -e MYSQL_USER=${MYSQL_USER} -d \
    -e MYSQL_PASSWORD=${MYSQL_PASSWORD} -e MYSQL_DATABASE=${MYSQL_DATABASE} \
    -e MYSQL_ROOT_PASSWORD="controle" -p ${MYSQL_PORT}:${MYSQL_PORT} --network=${NETWORK_ID} \
    --volumes-from=${DOCKER_VOLUME_NAME} ${DOCKER_MANTAINER_NAME}/${DOCKER_NAME}:${DOCKER_TAG}


