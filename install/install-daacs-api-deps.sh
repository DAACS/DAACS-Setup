#!/bin/bash

## Update
sudo apt-get -y update
sudo apt install figlet 

###### Install Git
sudo apt-get -y install git

################################################################################
##### Install Java
figlet -t -k -f /usr/share/figlet/small.flf "Installing Java"
sudo apt-get -y install openjdk-8-jdk

################################################################################
##### Install MongoDB
figlet -t -k -f /usr/share/figlet/small.flf "Installing MongoDB"

# remove any existing mongo
sudo service mongod stop
sudo apt remove -y mongodb-org*
sudo apt purge -y mongodb-org*
sudo rm -r /var/log/mongodb
sudo rm -r /var/lib/mongodb
sudo rm -rf /etc/systemd/system/mongodb.service

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
sudo apt update
sudo apt install -y mongodb-org

echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections


# sudo bash -c "> /etc/systemd/system/mongodb.service"
sudo bash -c 'echo "[Unit]
Description=High-performance, schema-free document-oriented database
After=network.target

[Service]
User=mongodb
ExecStart=/usr/bin/mongod --quiet --config /etc/mongod.conf

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/mongodb.service'

cat /etc/systemd/system/mongodb.service
sudo mkdir -p /data/db
sudo chown -R mongodb:mongodb /var/lib/mongodb
sudo chown mongodb:mongodb /tmp/mongodb-27017.sock

sudo systemctl start mongodb
sudo systemctl status mongodb
sudo systemctl enable mongodb

# Setup MongoDB
sudo service mongodb start

# create mongo users
mongo < mongo-user-script.js

# add bindIp if needed
# sudo sed -i -e 's/bindIp: 127.0.0.1/bindIp: 127.0.0.1,<NEW IP>/g' /etc/mongod.conf

figlet -t -k -f /usr/share/figlet/small.flf "Starting MongoDB"
sudo systemctl restart mongodb
sudo systemctl status mongodb
