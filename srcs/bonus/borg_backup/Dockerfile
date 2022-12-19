FROM debian:buster

RUN apt-get update && apt-get -y install --no-install-recommends \
	borgbackup \
    cron \
    && mkdir backup \
	&& rm -rf /var/lib/apt/lists/*

RUN borg init --encryption=none /backup

COPY ./tools /

RUN mv borgbackup_cron /etc/cron.d/ \
    && mv backup.sh /var/backup.sh \
    && chmod +x entrypoint.sh \
    && chmod +x /var/backup.sh \
    && chmod +x /etc/cron.d/borgbackup_cron \
    && crontab /etc/cron.d/borgbackup_cron

ENTRYPOINT ["./entrypoint.sh"]
CMD ["cron", "-f"]