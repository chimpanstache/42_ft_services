FROM alpine:3.12

RUN apk -U upgrade 

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
ADD telegraf.conf /etc/telegraf/telegraf.conf

RUN apk add nginx
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib \
	php7-curl php7-mbstring php7-json php7-session

#creating new user, group and a directory for files
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

RUN rm /etc/nginx/conf.d/default.conf
COPY wordpress.conf /etc/nginx/conf.d/wordpress.conf

RUN mkdir /run/nginx

COPY wp /var/www/wordpress

ADD wp.sh /setup/wp.sh

EXPOSE 5050

CMD ["/bin/ash",  "/setup/wp.sh"]