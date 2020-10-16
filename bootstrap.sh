#!/bin/bash
echo "Initializing infra components"
REPO_URL="https://github.com/ajaycheenath/java-simple-rest-bootstrap.git"
MYSQL_PORT=3306
MYSQL_PASSWORD=password
MYSQL_HOST=127.0.0.1
#Start mysql docker instance
docker stop mysql
docker rm mysql
docker run  --detach --name=mysql -p ${MYSQL_HOST}:${MYSQL_PORT}:3306  --env="MYSQL_ROOT_PASSWORD=${MYSQL_PASSWORD}" mysql:8.0
sleep 30
echo "Mysql running on port ${MYSQL_PORT}"
echo "To connect use: mysql -uroot -p${MYSQL_PASSWORD}  --host=${MYSQL_HOST} --port=${MYSQL_PORT}"

mysql -uroot -ppassword  --host=127.0.0.1 --port=3306 -e "create database app1;"
echo "Database app1 created"
cd ../java-app-engine

./deploy.sh ${REPO_URL} 1
echo "Application APP deployed"
sleep 20

APP_ID=$(curl -X POST -F "repo=${REPO_URL}" http://localhost:8081/app | jq -r '.id')
echo "App record is added in add DB"


