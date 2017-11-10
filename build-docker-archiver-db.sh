#!/bin/sh

#
# A simple script to build a container for the archiver's database.
#
# Gustavo Ciotto Pinton
# Controls Group - Brazilian Synchrotron Light Source Laboratory - LNLS
#

. ./env-vars.sh

### Creates a new storage volume for the container if it doesn't exist ###
# Checks if the volume already exists
DOCKER_DATA_CONTAINERS=$(docker ps -a | grep ${DOCKER_VOLUME_NAME})
# If not, it is created
if [ -z "${DOCKER_DATA_CONTAINERS}" ]; then
    echo 'Storage volume has not been found. Creating a new one ...'
    docker create -v ${PGDATA} --name ${DOCKER_VOLUME_NAME} postgres &> /dev/null
fi

### Creates a new internal network if it doesn't exist ###
DOCKER_NETWORKS=$(docker network ls | grep ${NETWORK_ID})
if [ -z "${DOCKER_NETWORKS}" ]; then
    echo 'Creating a new network...'
    docker network create ${NETWORK_ID} &> /dev/null
fi

docker build -t ${DOCKER_MANTAINER_NAME}/${DOCKER_NAME}:${DOCKER_TAG} .
