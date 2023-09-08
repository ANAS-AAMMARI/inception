#!/bin/sh

# Start MariaDB
service mariadb start

# Create SQL commands

cat << EOF > mariaDb.sql
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${USER_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';
EOF

# Run SQL commands
mysql < mariaDb.sql

# Flush privileges
mysql -e "FLUSH PRIVILEGES;" --password="${ROOT_PASS}"

# Stop MariaDB
service mariadb stop

# status MariaDB
service mariadb status

# Start MariaDB in foreground
mysqld_safe
