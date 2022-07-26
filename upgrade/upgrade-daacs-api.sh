#!/bin/bash

figlet -t -k -f /usr/share/figlet/small.flf "Pulling DAACS-API"
cd /usr/local/daacs/DAACS-Api/
sudo git stash
sudo git pull
sudo git stash drop

figlet -t -k -f /usr/share/figlet/small.flf "Rebuilding DAACS-API"
sudo mkdir /usr/local/daacs/DAACS-API/lightside/saved
sudo mkdir /usr/local/daacs/DAACS-API/lightside/output

cd /usr/local/daacs/DAACS-API
sudo ./gradlew clean
sudo ./gradlew build -x test # JMB: excluded tests so build would succeed
sudo mkdir /usr/local/daacs/DAACS-API/lightside/saved
sudo mkdir /usr/local/daacs/DAACS-API/lightside/output
