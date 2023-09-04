#!/bin/bash

# Update Ubuntu software packages.
apt-get update

# Set MySQL root password and app user password
MYSQL_ROOT_PWD='root123'
APP_USER_PWD='connor'

# Pre-configure password for MySQL installation
echo "mysql-server mysql-server/root_password password $MYSQL_ROOT_PWD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PWD" | debconf-set-selections

# Install MySQL server
apt-get -y install mysql-server
service mysql start

# Database setup for StudyGroupDB
echo "CREATE DATABASE StudyGroupDB;" | mysql -u root -p$MYSQL_ROOT_PWD
echo "CREATE USER 'mediauser'@'%' IDENTIFIED BY '$APP_USER_PWD';" | mysql -u root -p$MYSQL_ROOT_PWD
echo "GRANT ALL PRIVILEGES ON StudyGroupDB.* TO 'mediauser'@'%';" | mysql -u root -p$MYSQL_ROOT_PWD

# Create tables for study groups and files
mysql -u mediauser -p$APP_USER_PWD StudyGroupDB <<EOF
CREATE TABLE study_group_files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    study_group_files INT,
    filename VARCHAR(255) NOT NULL,
    filepath TEXT NOT NULL,
    FOREIGN KEY (study_group_files) REFERENCES study_group_files(id)
);
EOF

# Configure MySQL to accept external connections
sed -i'' -e '/bind-address/s/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL to apply changes
service mysql restart
