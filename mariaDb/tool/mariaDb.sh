#!/bin/bash

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"

mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASS}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'localhost' IDENTIFIED BY '${USER_PASS}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p $ROOT_PASS shutdown

exec mysqld_safe

# kill $(cat /var/run/mysqld/mysqld.pid)

# service mysql start