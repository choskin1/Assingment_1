#!/bin/bash

# Update the package list
sudo apt-get update -y

# Install Apache
sudo apt-get install -y apache2

# Install PHP and related packages
sudo apt-get install -y php libapache2-mod-php php-mysql

# Restart Apache to activate changes
sudo systemctl restart apache2

# Navigate to web root and create the 'studygroup' directory
cd /var/www/html
sudo mkdir -p studygroup

# Copy the required files into the 'studygroup' directory
sudo cp /vagrant/upload.html /var/www/html/studygroup/
sudo cp /vagrant/upload.php /var/www/html/studygroup/

# Create an 'uploads' directory inside 'studygroup'
sudo mkdir -p /var/www/html/studygroup/uploads

# Adjust the ownership and permissions of the 'studygroup' directory
sudo chown -R www-data:www-data /var/www/html/studygroup
sudo chmod -R 755 /var/www/html/studygroup
