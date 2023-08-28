#!/bin/bash

# Start OpenRC
openrc

# create a file to indicate that the system is running in the OpenRC init system
touch /run/openrc/softlevel
# Initialize MariaDB
/etc/init.d/mariadb setup

# Start MariaDB service
# rc-service mariadb start
/etc/init.d/mariadb start

# Create SQL statements file
cat << EOF > mariaDb.sql
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${USER_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';
FLUSH PRIVILEGES;
EOF

# Run SQL commands
mysql < mariaDb.sql

# Stop MariaDB service
# rc-service mariadb stop
/etc/init.d/mariadb stop

# Start MariaDB service for foreground
# exec mysqld --user=root 
mysqld_safe

#===================================================================================================
# #!/bin/bash

# # rc-service mariadb status

# openrc

# touch /run/openrc/softlevel

# /etc/init.d/mariadb setup

# rc-service mariadb start

# echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" > mariaDb.sql

# echo "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${USER_PASS}';" >> mariaDb.sql

# echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';" >> mariaDb.sql

# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASS}';" >> mariaDb.sql

# echo "FLUSH PRIVILEGES;" >> mariaDb.sql

# # mysql -e "FLUSH PRIVILEGES;" --password="1234"

# mysql < mariaDb.sql

# rc-service mariadb stop

# # rc-service mariadb status

# # mysql 

# mysql_safe mysqld &