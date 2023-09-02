#!/bin/bash

# make sure /run/mysqld exists
if [ ! -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld
fi

# set permissions
chmod 777 /run/mysqld

# Start MariaDB service for background
mysql_install_db 2> /dev/null 

# Create SQL statements file
cat << EOF > /tmp/mariaDb.sql
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${USER_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';
FLUSH PRIVILEGES;
EOF

# Run SQL commands
mysqld --init-file /tmp/mariaDb.sql 2> /dev/null


# Start MariaDB service for foreground
echo "starting mariadb server..."
exec mysqld --user=root 2> /dev/null
# mysqld_safe 
