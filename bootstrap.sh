#!/bin/bash
echo "Initializing infra components"

MYSQL_PORT=50000
MYSQL_PASSWORD=password
#Start mysql docker instance
docker stop infra-mysql
docker rm infra-mysql
docker run --detach --name=infra-mysql -p ${MYSQL_IP}:${MYSQL_PORT}:3306  --env="MYSQL_ROOT_PASSWORD=${MYSQL_PASSWORD}" mysql:8.0.21

echo "Mysql running on port ${MYSQL_PORT}"
echo "To connect use: mysql -uroot -p${MYSQL_PASSWORD}  --host=0.0.0.0 --port=50000"