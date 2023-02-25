FROM alpine:latest

RUN apk update && apk upgrade && apk add --no-cache mariadb mariadb-client dumb-init

RUN	adduser -S mariadb && addgroup -S mariadb

RUN mkdir -p /var/run/mysqld
RUN chown -R mariadb:mariadb /var/lib/mysql /var/run/mysqld

COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./tools /tools

RUN chmod 777 -R /var/lib/mysql /usr/bin/dumb-init /tools

EXPOSE 3306
ENTRYPOINT ["dumb-init", "--", "/bin/sh", "/tools/init.sh"]
CMD ["mariadbd", "--user=mariadb", "--init-file=/tools/init.sql"]
