#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install prosody

## Update Ubuntu software packages.
#sudo apt update
#
#
##
### Install Jitsi Meet
#wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -
#sudo sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list"
#sudo apt update

#apt-get update
#apt-get -y install jitsi-meet
#
#apt-get install -y python3 python3-pip
#pip3 install Flask flask_sqlalchemy flask_migrate flask_login
#cd /vagrant
#python3 meeting_requests.py
