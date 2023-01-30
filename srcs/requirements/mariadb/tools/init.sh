#!/bin/sh

mkdir -p db
#chown -R mysql:mysql ./
mariadb-install-db --user=mysql --basedir=/usr --datadir=$PWD/db > /dev/null 2>&1
#exec mysqld --user=mysql --datadir=./db --init-file=/etc/mysql/tools/init-db.sql
exec mysqld --user=mysql --datadir=./db --init-file=$PWD/tools/init-db.sql > /dev/null 2>&1

#exec /usr/bin/mysqld --user=mysql --console
#/usr/bin/mysqld_safe --datadir='./db'
