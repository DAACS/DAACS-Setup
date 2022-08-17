#!/bin/bash

##### Web component
figlet -t -k -f /usr/share/figlet/small.flf "Cloning DAACS-Web"
sudo mkdir /usr/local/daacs
cd /usr/local/daacs
sudo git clone https://github.com/DAACS/DAACS-Web.git
cd /usr/local/daacs/DAACS-Web/daacs

figlet -t -k -f /usr/share/figlet/small.flf "Copying /daacs/config/environment.js"
sudo cp /daacs/config/environment.js /usr/local/daacs/DAACS-Web/daacs/config/environment.js

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

figlet -t -k -f /usr/share/figlet/small.flf "Building DAACS-Web"

sudo chown -R $USER:$GROUP /usr/local/daacs/.*
npm install && npm install node-sass@3.13.1
bower --allow-root install
cd /usr/local/daacs/DAACS-Web/node
npm install

cd /usr/local/daacs/DAACS-Web/daacs
ember build --environment=production
