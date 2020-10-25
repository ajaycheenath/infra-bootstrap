#!/bin/bash
printf "\nInitializing infra components\n=================================\n"

#Bring up infra components here
./startMysql.sh

printf "\nBring Up App Manager\n=================================\n"
#Bring up App Manager
./startAppManager.sh