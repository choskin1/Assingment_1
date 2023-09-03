#!/bin/bash

# Update Ubuntu software packages.
apt-get update

# Install Python3 and pip3
apt-get install -y python3 python3-pip

# Install Flask and other necessary Python packages
pip3 install Flask flask_sqlalchemy flask_migrate flask_login


pip3 install -r /vagrant/requirements.txt


