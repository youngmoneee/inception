#!/bin/sh

docker run -p 9000:9000 -v WordPress:/var/www/wordpress --net inceptionet --name wordpress wordpress
