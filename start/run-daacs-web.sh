#!/bin/bash

sudo cp -v /daacs/config/environment.js /usr/local/daacs/DAACS-Web/daacs/config/environment.js

figlet -t -k -f /usr/share/figlet/small.flf "Starting DAACS-Web"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

cd /usr/local/daacs/DAACS-Web/node
sudo rm -rf /usr/local/daacs/DAACS-Web/nohup.out
sudo bash -c 'echo > /usr/local/daacs/DAACS-Web/nohup.out'
export PORT=8000
nohup npm start --max-old-space-size=1024 >/usr/local/daacs/DAACS-Web/nohup.out &
