#!/bin/bash

REPO_URL="https://github.com/ajaycheenath/java-simple-rest-bootstrap.git"

APP_MANAGER_EXISTS=false
APP_ID=1
PORT=8080

if [ -d /home/ajay/mysql-data/app1/ ] ; then
  APP_MANAGER_EXISTS=true
  echo "App Manager database already exists"
else
  echo "Creating database: app1"
  mysql -uroot -ppassword  --host=127.0.0.1 --port=3306 -e "create database app1;"
fi

echo "Deploying App manager. App Id: ${APP_ID}, Port number: ${PORT}"

cd ../java-app-engine
./deploy.sh ${REPO_URL} 1

sleep 60

if [ "${APP_MANAGER_EXISTS}" = false ] ; then
  echo "Adding new App Manager entry in app.app1 database"
  APP_DETAILS=$(curl -X POST -F "repo=${REPO_URL}" http://localhost:8081/app)
  echo "App Manager details: ${APP_DETAILS}"
fi
