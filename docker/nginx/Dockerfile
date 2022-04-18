FROM nginx:1.12


RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY ./script.sh /
RUN chmod +x /script.sh

COPY ./index.html /usr/share/nginx/html/index.html

EXPOSE 443

CMD ["/bin/sh", "-c", "./script.sh"]