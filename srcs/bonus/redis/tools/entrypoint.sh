#!/bin/bash

sleep 20

wget --no-check-certificate https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar
mv wp-cli.phar /usr/bin/wp

wp plugin install redis-cache --allow-root --activate --insecure --path=/var/www/wordpress
# mv ./object-cache.php /var/www/wordpress/wp-content/
# chown -R www-data:www-data /var/www/wordpress/object-cache.php
# chmod 755 /var/www/wordpress/object-cache.php

redis-server
redis-cli monitor