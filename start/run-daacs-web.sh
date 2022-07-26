#!/bin/bash

figlet -t -k -f /usr/share/figlet/small.flf "Updating Web config"
cp /usr/local/daacs/DAACS-Web/node/package.json /daacs/start/package.json
# Update the environment.js file. Add the IP address and domain to the hostWhitelist parameter
sudo rm /usr/local/daacs/DAACS-Web/daacs/config/web-config.json
# sudo -c 'echo /usr/local/daacs/DAACS-Web/daacs/config/environment.js > /usr/local/daacs/DAACS-Web/daacs/config/web-config.json'
cp /usr/local/daacs/DAACS-Web/daacs/config/environment.js /usr/local/daacs/DAACS-Web/daacs/config/web-config.json

figlet -t -k -f /usr/share/figlet/small.flf "Starting DAACS-Web"
PORT=8000 CLIENT_CONFIG_PATH=/usr/local/daacs/DAACS-Web/daacs/config/web-config.json npm start --max-old-space-size=1024

