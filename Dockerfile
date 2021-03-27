FROM alpine:latest

RUN apk add --no-cache \
        mysql-client \
    ; \
    mkdir -p /mysql-backup

ENV COMPRESS_CMD="gzip" \
    CRON_TIME="0 0 * * *" \
    MYSQL_DB="--all-databases"
ADD run.sh /run.sh

RUN chmod +x run.sh
VOLUME ["/mysql-backup"]

ENTRYPOINT ["/run.sh"]
CMD ["/usr/sbin/crond", "-l 2", "-f"]
