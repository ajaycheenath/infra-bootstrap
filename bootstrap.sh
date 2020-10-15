#!/bin/bash
echo "Initializing infra components"

MYSQL_PORT=3306
MYSQL_PASSWORD=password
MYSQL_HOST=127.0.0.1
#Start mysql docker instance
docker stop mysql
docker rm mysql
docker run  --detach --name=mysql -p ${MYSQL_HOST}:${MYSQL_PORT}:3306  --env="MYSQL_ROOT_PASSWORD=${MYSQL_PASSWORD}" mysql:8.0
sleep 20



echo "Mysql running on port ${MYSQL_PORT}"
echo "To connect use: mysql -uroot -p${MYSQL_PASSWORD}  --host=${MYSQL_HOST} --port=${MYSQL_PORT}"