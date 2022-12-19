FROM debian:buster

RUN apt-get update && apt-get -y install --no-install-recommends \
	php7.3-fpm \
    wget \
    && rm -rf /var/lib/apt/lists/*

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

COPY ./tools/entrypoint.sh .

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ./entrypoint.sh
