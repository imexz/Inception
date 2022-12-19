#login screen adminer: use service name of database as Server name

sleep 15
wget --no-check-certificate "http://www.adminer.org/latest.php" -O /var/www/wordpress/adminer.php
chown -R www-data:www-data /var/www/wordpress/adminer.php
chmod 755 /var/www/wordpress/adminer.php

mkdir /run/php

/usr/sbin/php-fpm7.3 -F