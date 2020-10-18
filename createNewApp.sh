#!/bin/bash
#GIT_REPO=$1
current_dir=$PWD
REPO_URL="https://github.com/ajaycheenath/java-simple-rest-bootstrap.git"
APP_DETAILS=$(curl -X POST -F "repo=${REPO_URL}" http://localhost:8081/app)
APP_ID=$(echo $APP_DETAILS | jq -r '.id')
PORT=$(echo $APP_DETAILS | jq -r '.port')
echo "Added new app details in App DB. appId: ${APP_ID} , ${PORT}"
echo "Next app id: ${APP_ID}"
APP_NAME=app-${APP_ID}


echo "Creating new app branch..."

echo "Will be cloning ${GIT_REPO} to ${APP_NAME}"
rm -rf /tmp/${APP_NAME}
echo "Removed /tmp/${APP_NAME}"
git clone ${REPO_URL} /tmp/${APP_NAME}/

cd  /tmp/${APP_NAME}
git branch -d ${APP_NAME}
git push origin --delete ${APP_NAME}
git checkout -b ${APP_NAME}
git push --set-upstream origin ${APP_NAME}

echo "Created app branch ${APP_NAME}"

# Below two lines doesn't belong here. When register for service create database, user and password
mysql -uroot -ppassword  --host=127.0.0.1 --port=3306 -e "drop database app${APP_ID};"
mysql -uroot -ppassword  --host=127.0.0.1 --port=3306 -e "create database app${APP_ID};"

echo "Created new app DB: app${APP_ID}"
cd $current_dir
cd ../java-app-engine
./deploy.sh ${REPO_URL} ${APP_ID}


