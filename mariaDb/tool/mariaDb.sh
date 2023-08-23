#!/bin/bash

# MariaDB

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$USER_PASSWORD';"

mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$ROOT_PASSWORD shutdown

exec mysqld_safe
