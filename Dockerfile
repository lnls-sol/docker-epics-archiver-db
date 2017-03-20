
FROM mysql:latest

MAINTAINER Gustavo Ciotto

COPY archappl_mysql.sql /docker-entrypoint-initdb.d
