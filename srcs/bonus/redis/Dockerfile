FROM debian:buster

RUN apt-get update && apt-get -y install --no-install-recommends \
	redis-server \
    php7.3-fpm \
    php7.3-mysqli \
    php7.3-redis \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && echo "maxmemory 256 mb\nmaxmemory-policy allkeys-lru\n" >> /etc/redis/redis.conf

COPY ./tools .

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ./entrypoint.sh
