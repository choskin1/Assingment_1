#!/bin/bash

# Update Ubuntu software packages.
apt-get update

# Set MySQL root password
export MYSQL_PWD='insecure_mysqlroot_pw'

# Pre-configure password for MySQL installation
echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections

# Install MySQL server
apt-get -y install mysql-server
service mysql start

# Database setup
echo "CREATE DATABASE myappdb;" | mysql
echo "CREATE USER 'appuser'@'%' IDENTIFIED BY 'insecure_db_pw';" | mysql
echo "GRANT ALL PRIVILEGES ON myappdb.* TO 'appuser'@'%';" | mysql

# Set password for database operations
export MYSQL_PWD='insecure_db_pw'
cat /vagrant/setup-database.sql | mysql -u appuser myappdb

# Configure MySQL to accept external connections
sed -i'' -e '/bind-address/s/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL to apply changes
service mysql restart