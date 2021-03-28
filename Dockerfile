FROM ubuntu:bionic

RUN apt update && apt install gnupg2 curl cron -y && \
     apt install -y mysql-client && \
    echo "mysql-client hold" | dpkg --set-selections && \
    mkdir -p /mysql-backup

ENV COMPRESS_CMD="gzip" \
    CRON_TIME="0 0 * * *" \
    MYSQL_DB="--all-databases"
ADD run.sh /run.sh

RUN chmod +x run.sh
VOLUME ["/mysql-backup"]

CMD ["/run.sh"]

