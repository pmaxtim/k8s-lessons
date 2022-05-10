FROM nginx:1.12

COPY ./script.sh /
RUN chmod +x /script.sh

COPY ./index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["/bin/sh", "-c", "./script.sh"]