#!/bin/bash
# === DATABASE SERVER SETUP ===

# Update & install MySQL server
sudo apt update -y
sudo apt install -y mysql-server

# Start & enable MySQL
sudo systemctl start mysql
sudo systemctl enable mysql

# Allow remote connections
sudo sed -i "s/^bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

# Wait a few seconds to make sure MySQL is running
sleep 5

# Create database if it doesn't exist
sudo mysql -e "CREATE DATABASE IF NOT EXISTS library;"

# Create user 'root'@'%' with password (or update password if exists)
sudo mysql -e "ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'Burntwood1!';"
sudo mysql -e "GRANT ALL PRIVILEGES ON library.* TO 'root'@'%';"
sudo mysql -e "FLUSH PRIVILEGES;"