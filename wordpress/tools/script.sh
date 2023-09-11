#!/bin/sh

# install wp-cli
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# make it executable
chmod +x wp-cli.phar

# move it to path
sudo mv wp-cli.phar /usr/local/bin/wp

# install wordpress
wp core download --path=wordpress

# create wp-config.php
wp config create --allow-root \
    --dbname=$DB_NAME \
    --dbuser=$DB_USER \
    --dbpass=$DB_PASSWORD \
    --dbhost=mariadb:3306 \
    --path=/var/www/wordpress

# install wordpress
wp core install --allow-root \
    --url=$WP_URL \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL \
    --path=/var/www/wordpress

# create user for wordpress
wp user create --allow-root \
    $WP_USER \
    $WP_USER_EMAIL \
    --user_pass=$WP_USER_PASSWORD \
    --role=author \
    --path=/var/www/wordpress
