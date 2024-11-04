#!/bin/bash

# Install Apache
sudo apt install -y apache2

# Install MySQL
sudo apt install -y mysql-server

# Secure MySQL installation
sudo mysql_secure_installation

# Install PHP and necessary modules
sudo apt install -y php libapache2-mod-php php-mysql

# Create a simple database and user
DB_NAME="simple-db"
DB_USER="dbuser"
DB_PASS="dbpassword"

sudo mysql -e "CREATE DATABASE ${DB_NAME};"
sudo mysql -e "CREATE USER '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASS}';"
sudo mysql -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"

# Create a table in the database
sudo mysql -e "USE simple-db; CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100), email VARCHAR(100));"

# Insert some sample data
sudo mysql -e "USE simple-db; INSERT INTO users (name, email) VALUES ('John Doe', 'john@doe.com');"
