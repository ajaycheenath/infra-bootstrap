#!/bin/bash
echo "Initializing infra components"

MYSQL_PORT=50001
MYSQL_PASSWORD=password
MYSQL_HOST=127.0.0.1
#Start mysql docker instance
docker stop infra-mysql
docker rm infra-mysql
docker run  --detach --name=infra-mysql -p ${MYSQL_HOST}:${MYSQL_PORT}:3306  --env="MYSQL_ROOT_PASSWORD=${MYSQL_PASSWORD}" mysql:8.0
sleep 10

echo "Mysql running on port ${MYSQL_PORT}"
echo "To connect use: mysql -uroot -p${MYSQL_PASSWORD}  --host=${MYSQL_HOST} --port=${MYSQL_PORT}"