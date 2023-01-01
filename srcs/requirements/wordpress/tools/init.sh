#!/bin/sh

#adduser nginx
#addgroup nginx
chown -R nginx:nginx html
pwd
exec /usr/sbin/php-fpm8 -F
