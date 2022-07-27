#!/bin/bash

figlet -t -k -f /usr/share/figlet/small.flf "Stopping DAACS-API"
kill $(lsof -t -i:8080)
killall -9 java # redundant kill in case you try to stop it before spring starts up
