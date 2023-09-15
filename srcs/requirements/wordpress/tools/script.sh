#!/bin/sh

# install wp-cli
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# make it executable
chmod +x wp-cli.phar

# move it to path
mv wp-cli.phar /usr/local/bin/wp

# install wordpress
wp core download --path=/var/www --allow-root

cat << EOF > /var/www/wp-config.php
<?php
define( 'DB_NAME', '$DB_NAME' );
define( 'DB_USER', '$DB_USER' );
define( 'DB_PASSWORD', '$USER_PASS' );
define( 'DB_HOST', 'mariadb:3306' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('FS_METHOD','direct');
\$table_prefix = '';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
define( 'ABSPATH', __DIR__ . '/' );}
require_once ABSPATH . 'wp-settings.php';
EOF

# create wp-config.php
# wp core config --allow-root \
#     --dbname=$DB_NAME \
#     --dbuser=$DB_USER \
#     --dbpass=$DB_PASS \
#     --dbhost=mariadb:3306 \
#     --path=/var/www

# # create admin user for wordpress
wp core install --allow-root \
    --url=$WP_URL \
    --title=$WP_TITLE \
    --admin_user=$WP_ADMIN_USER \
    --admin_password=$WP_ADMIN_PASSWORD \
    --admin_email=$WP_ADMIN_EMAIL \
    --path=/var/www

# # create normal user for wordpress
wp user create --allow-root \
    $WP_USER \
    $WP_USER_EMAIL \
    --user_pass=$WP_USER_PASSWORD \
    --role=author \
    --path=/var/www

php-fpm81 -F