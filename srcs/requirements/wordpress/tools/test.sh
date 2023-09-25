#!/bin/sh

# mkdir -p /var/www/html

cd /var/www/html

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

# wp core config --allow-root 
wp config create --allow-root \
    --dbname=$DB_NAME \
    --dbuser=$DB_USER \
    --dbpass=$DB_PASS \
    --dbhost=mariadb --skip-check

wp core install --allow-root \
    --url=$WP_URL \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASS \
    --admin_email=$WP_ADMIN_EMAIL 

wp user create --allow-root \
    $WP_USER \
    $WP_USER_EMAIL \
    --role=author \
    --user_pass=$WP_USER_PASS 

php-fpm81 -F