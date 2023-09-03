#!/bin/bash

# Update Ubuntu software packages.
apt-get update

# Install Python3 and pip3
apt-get install -y python3 python3-pip
pip3 install pymysql

# Install Flask and other necessary Python packages
pip3 install Flask flask_sqlalchemy flask_migrate flask_login

cd /vagrant/app

export FLASK_APP=main_app:app
sudo python3 main_app.py




