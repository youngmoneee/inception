#!/bin/sh

docker run -it -p 3306:3306 -v DB:/mymy --net inceptionet --name mariadb mariadb
