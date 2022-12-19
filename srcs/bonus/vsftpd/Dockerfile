FROM debian:buster

RUN apt-get update && apt-get -y install --no-install-recommends \
	vsftpd \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/vsftpd/empty \
    && mkdir -p /etc/vsftpd \
    && mkdir -p /var/ftp \
    && mv /etc/vsftpd.conf /etc/vsftpd.orig \
    && mkdir /etc/service \
    && mkdir /etc/service/vsftpd

COPY ./tools .

RUN chmod +x ./entrypoint.sh

ENTRYPOINT ./entrypoint.sh
