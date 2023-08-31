#!/bin/bash

# Update Ubuntu software packages.
apt-get update

# Install Apache, PHP, and necessary modules
apt-get install -y apache2 php libapache2-mod-php php-mysql

# Copy website configuration from shared folder
cp /vagrant/mywebsite.conf /etc/apache2/sites-available/

# Activate custom website configuration and disable default
a2ensite mywebsite
a2dissite 000-default

# Restart Apache to apply changes
service apache2 restart