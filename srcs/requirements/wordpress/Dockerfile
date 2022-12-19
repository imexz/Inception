FROM debian:buster

RUN apt-get update && apt-get -y install --no-install-recommends \
	php7.3-fpm \
	php-mysqli \
	mariadb-client \
	wget \
	&& rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

COPY ./tools/entrypoint.sh /

COPY ./conf/wp-config.php /

RUN chmod +x /entrypoint.sh

EXPOSE 9000

ENTRYPOINT ./entrypoint.sh
