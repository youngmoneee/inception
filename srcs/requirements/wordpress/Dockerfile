FROM alpine:latest

RUN sed -i 's/v3.17/v3.15/g' /etc/apk/repositories
RUN apk update && apk upgrade \
		&& apk add --no-cache php8-common php8-session php8-iconv php8-json php8-gd php8-curl php8-xml php8-mysqli php8-imap php8-cgi fcgi php8-pdo php8-pdo_mysql php8-soap php8-posix php8-gettext php8-ldap php8-ctype php8-dom php8-simplexml php8 php8-phar php8-fpm mariadb-client

RUN mkdir -p /var/www/wordpress
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/bin/wp

RUN chmod +x /usr/bin/wp

COPY ./conf/www.conf /etc/php8/php-fpm.d/www.conf
COPY ./tools /tools

RUN	adduser -S nginx &&	addgroup -S nginx && chown -R nginx:nginx /var/www /tools

WORKDIR /var/www/wordpress

EXPOSE 9000

ENTRYPOINT ["/tools/install.sh"]
