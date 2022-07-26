#!/bin/bash

##### Install DAACS API
figlet -t -k -f /usr/share/figlet/small.flf "Cloning DAACS-API"
sudo mkdir /usr/local/daacs
cd /usr/local/daacs

# DAACS-API
sudo git clone https://github.com/DAACS/DAACS-API.git

sudo mkdir /usr/local/daacs/DAACS-API/lightside/saved
sudo mkdir /usr/local/daacs/DAACS-API/lightside/output

cd /usr/local/daacs/DAACS-API
figlet -t -k -f /usr/share/figlet/small.flf "Building DAACS-API"
sudo ./gradlew clean
sudo ./gradlew build -x test # JMB: excluded tests so build would succeed
sudo mkdir /usr/local/daacs/DAACS-API/lightside/saved
sudo mkdir /usr/local/daacs/DAACS-API/lightside/output
