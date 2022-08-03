#!/bin/bash

##### Install Web dependencies
sudo apt-get install build-essential chrpath libssl-dev libxft-dev libfreetype6-dev libfreetype6 libfontconfig1-dev libfontconfig1 -y
figlet -t -k -f /usr/share/figlet/small.flf "Installing PhantomJS"
# PhantomJS
sudo wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
sudo tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/
sudo ln -s /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/
phantomjs --version

figlet -t -k -f /usr/share/figlet/small.flf "Installing Python 2"
#Install Python
sudo apt install python2.7
ln -s /usr/bin/python2.7 /usr/bin/python

figlet -t -k -f /usr/share/figlet/small.flf "Installing Node"
# NodeJS
curl -L https://www.npmjs.com/install.sh | sh
sudo apt install nodejs -y
# sudo apt-get -y install nodejs npm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install v8.16.0
npm install -g npm@6.4.1
node --version
npm --version
npm install -g core-js
figlet -t -k -f /usr/share/figlet/small.flf "Installing Ember"
npm install -g ember-cli@2.6.1

sudo chown -R $USER:$(id -gn $USER) /home/$USER/.config
ember --version
npm install -g bower
bower --version # 1.8.14
