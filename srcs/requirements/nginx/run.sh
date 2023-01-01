#!/bin/sh

docker run -p 443:443 -v WordPress:/var/www/wordpress --net inceptionet --name nginx nginx
