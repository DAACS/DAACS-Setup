#!/bin/bash

# Start the API
figlet -t -k -f /usr/share/figlet/small.flf "Updating daacsapiProperties"
sudo cp -v ~/daacs.properties /usr/local/daacs/daacs.properties
cd /usr/local/daacs/DAACS-API/
export daacsapiProperties='/usr/local/daacs/daacs.properties'
echo $daacsapiProperties


figlet -t -k -f /usr/share/figlet/small.flf "Starting DAACS-API"
sudo rm /usr/local/daacs/DAACS-API/nohup.out
sudo bash -c 'echo > /usr/local/daacs/DAACS-API/nohup.out'
nohup java -jar build/libs/daacsapi-dev.jar &
tail -f /usr/local/daacs/DAACS-API/nohup.out & exit
