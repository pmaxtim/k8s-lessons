#!/bin/bash

cat /etc/hostname >> /usr/share/nginx/html/index.html
echo  "<h3><font color=gold>The secret DNS: $NGINX_EXTERNAL_DNS </h3>" >> /usr/share/nginx/html/index.html
echo -e "<h3><font color=gold>The secret username: $NGINX_USERNAME </h3>" >> /usr/share/nginx/html/index.html
echo -e "<h3><font color=gold>The secret password: $NGINX_PASSWORD </h3>" >> /usr/share/nginx/html/index.html

nginx -g 'daemon off;'