#!/bin/bash
cd /var/www/

mkdir /run/php

wget --no-check-certificate https://wordpress.org/latest.tar.gz;
tar -xzvf latest.tar.gz;
rm latest.tar.gz;
rm -f ./wordpress/wp-config-sample.php;
mv /wp-config.php ./wordpress/
chown -R www-data:www-data ./wordpress

wget --no-check-certificate https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar
mv wp-cli.phar /usr/bin/wp

sleep 10

wp core install --allow-root --url='mstrantz.42.fr' --title='42 Inception' --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD --admin_email=$WORDPRESS_DB_USER_EMAIL --path='/var/www/wordpress';
wp user create --allow-root $WORDPRESS_USER_LOGIN max@example.com --role=author --user_pass=$WORDPRESS_USER_PASSWORD --path='/var/www/wordpress';


/usr/sbin/php-fpm7.3 -F