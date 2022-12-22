FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache mariadb

COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY tools /etc/mysql/tools
WORKDIR /etc/mysql

EXPOSE 3306
ENTRYPOINT ["/bin/sh", "tools/init.sh"]
