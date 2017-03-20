#!/bin/bash 

. ./env-vars.sh

DOCKER_NETWORKS=$(docker network ls | grep ${NETWORK_ID})
if [ -z ${DOCKER_NETWORKS:+x} ]; then
    docker network create ${NETWORK_ID}
fi


