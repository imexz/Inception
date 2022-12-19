#!/bin/bash
if [ ! -d /var/lib/mysql/wp_db ]
then 
/etc/init.d/mysql start
mysql -u root << EOF
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${MARIADB_ROOT_PASSWORD}');
CREATE DATABASE ${WORDPRESS_DB_NAME};
CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${MARIADB_USER}'@'%';
EOF
/etc/init.d/mysql stop
sleep 1
fi

mysqld_safe