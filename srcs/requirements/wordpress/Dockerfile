FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache php8-fpm php8-common dumb-init mysql-client php8-mysqlnd
ADD https://ko.wordpress.org/wordpress-6.1.1-ko_KR.tar.gz /var/www/wp.tar.gz
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/bin/wp
RUN tar -xzf /var/www/wp.tar.gz -C /var/www

COPY ./conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY ./tools /tools

RUN	adduser -S nginx &&	addgroup -S nginx && chown -R nginx:nginx /var/www && chmod +x /usr/bin/dumb-init /usr/bin/wp /tools/install.sh

#RUN /tools/install.sh

EXPOSE 9000

#ENTRYPOINT ["dumb-init", "/usr/sbin/php-fpm8", "-F"]
