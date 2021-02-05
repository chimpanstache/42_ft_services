FROM alpine:3.12

RUN apk -U upgrade 

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
ADD telegraf.conf /etc/telegraf/telegraf.conf

RUN apk add nginx 
RUN	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib \
	php7-curl php7-mbstring php7-json php7-session

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/nginx.conf
COPY index.html /www/index.html

RUN mkdir /run/nginx

ADD phpMyAdmin-5.0.4-english /var/www/phpmyadmin 

ADD phpmyadmin.sh /setup/phpmyadmin.sh
EXPOSE 5000

CMD ["/bin/ash",  "/setup/phpmyadmin.sh"]