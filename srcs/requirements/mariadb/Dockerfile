FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache mariadb==10.6.10-r0 dumb-init

RUN mkdir -p /run/mysqld /var/lib/mysql

#RUN	adduser -S mysql &&	addgroup -S mysql
RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld
COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./init.sql /var/lib/mysql/init.sql
RUN mariadb-install-db

EXPOSE 3306
ENTRYPOINT ["dumb-init", "--"]
CMD ["mariadbd"]
#ENTRYPOINT sh
#ENTRYPOINT ["/bin/sh", "tools/init.sh"]
