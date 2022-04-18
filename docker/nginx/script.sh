#!/bin/bash

cat /etc/hostname >> /usr/share/nginx/html/index.html

nginx -g 'daemon off;'