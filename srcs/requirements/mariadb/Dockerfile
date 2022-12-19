FROM debian:buster

RUN apt-get update && apt-get -y install --no-install-recommends \
	mariadb-server \
	&& rm -rf /var/lib/apt/lists/*

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY ./tools /

RUN chmod +x ./entrypoint.sh

EXPOSE 3306

ENTRYPOINT ["./entrypoint.sh"]
