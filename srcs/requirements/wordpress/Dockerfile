FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache php8-fpm
ADD https://ko.wordpress.org/wordpress-6.1.1-ko_KR.tar.gz /var/www/wp.tar.gz
RUN tar -xzf /var/www/wp.tar.gz -C /var/www && rm -rf /var/www/wp.tar.gz

#COPY tools /var/www/tools

COPY conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY ./index.php /var/www/index.php
RUN	adduser -S nginx &&	addgroup -S nginx
RUN chown -R nginx:nginx /var/www

EXPOSE 9000
ENTRYPOINT /usr/sbin/php-fpm8 -F
