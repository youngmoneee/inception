FROM alpine:3.16

RUN apk update && apk upgrade && apk add mariadb

ENTRYPOINT ["mariadb"]

EXPOSE 3306
