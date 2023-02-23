FROM alpine:3.16

RUN apk update && apk upgrade \
		&& apk add --no-cache php8-common php8-session php8-iconv php8-json php8-gd php8-curl php8-xml php8-mysqli php8-imap php8-cgi fcgi php8-pdo php8-pdo_mysql php8-soap php8-posix php8-gettext php8-ldap php8-ctype php8-dom php8-simplexml php8 php8-phar php8-fpm mariadb-client

#ADD https://ko.wordpress.org/wordpress-6.1.1-ko_KR.tar.gz /var/www/wp.tar.gz
#RUN tar -xzf /var/www/wp.tar.gz -C /var/www && chmod +x /usr/bin/wp
RUN mkdir -p /var/www/wordpress
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/bin/wp

RUN chmod +x /usr/bin/wp #/usr/bin/dumb-init

COPY ./conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY ./tools /tools

RUN	adduser -S nginx &&	addgroup -S nginx && chown -R nginx:nginx /var/www

WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["/tools/install.sh"]
