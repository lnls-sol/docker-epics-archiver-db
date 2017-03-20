#!/bin/bash

DOCKER_MANTAINER_NAME=gciotto
DOCKER_NAME=epics-archiver-mysql-db
DOCKER_RUN_NAME=epics-archiver-mysql-db

DOCKER_VOLUME_NAME=archiver-mysql-db-volume
MYSQL_DATA=/var/lib/mysql

MYSQL_USER=lnls_user
MYSQL_PASSWORD=controle
MYSQL_DATABASE=lnls_archiver_db
MYSQL_PORT=3306

NETWORK_ID=epics-archiver-network
