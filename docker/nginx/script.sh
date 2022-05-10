#!/bin/bash

cat /etc/hostname >> /usr/share/nginx/html/index.html
echo  "<h3><font color=gold>The first secret: $THE_FIRST_SECRET </h3>" >> /usr/share/nginx/html/index.html
echo -e "<h3><font color=gold>The second secret: $THE_SECOND_SECRET </h3>" >> /usr/share/nginx/html/index.html

nginx -g 'daemon off;'