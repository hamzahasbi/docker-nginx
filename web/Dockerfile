FROM fholzer/nginx-brotli
RUN addgroup -g 1000 -S www-data \
 && adduser -u 1000 -D -S -G www-data www-data
COPY ./server.conf /etc/nginx/nginx.conf
COPY ./site.conf /etc/nginx/conf.d/default.conf
WORKDIR /var/www/html
VOLUME /var/www/html
