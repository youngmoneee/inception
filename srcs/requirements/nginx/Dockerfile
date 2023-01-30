FROM alpine:3.16

RUN apk update && apk upgrade && apk add --no-cache nginx openssl && mkdir -p /etc/nginx/ssl
COPY conf/nginx.conf /etc/nginx/http.d/inception.conf

RUN openssl req -newkey rsa:2048 -nodes -days 365 -x509 \
		-out /etc/nginx/ssl/youngpar.pem \
		-keyout /etc/nginx/ssl/youngpar.key \
		-subj "/C=KR/ST=Seoul/L=Gangnamgu/O=42/CN=youngpar/"

EXPOSE 443
ENTRYPOINT ["nginx", "-g", "daemon off;"]
