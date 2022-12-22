FROM alpine:3.16

ADD https://ko.wordpress.org/wordpress-6.1.1-ko_KR.tar.gz /var/www/wp.tar.gz
RUN tar -xzf /var/www/wp.tar.gz -C /var/www && rm -rf /var/www/wp.tar.gz
RUN apk update && apk upgrade && apk add php-fpm
COPY tools /var/www/tools
COPY conf/www.conf /etc/php8/php-fpm.d/www.conf
RUN adduser --disabled-password nginx
#USER nginx
WORKDIR /var/www

EXPOSE 9000
ENTRYPOINT /usr/sbin/php-fpm8 -F
#ENTRYPOINT ["/bin/sh", "tools/init.sh"]
