FROM alpine:3.12

# *
# * phpmyadmin has been installed to:
# *     /usr/share/webapps/phpmyadmin
# * phpmyadmin config file has been installed to:
# *     /etc/phpmyadmin/config.inc.php
# * If you use apache2:
# *     1) Change the ownership of the config directory:
# *            chown -R apache:apache /etc/phpmyadmin
# *     2) See if you need to modify the apache2 config:
# *            /etc/apache2/conf.d/phpmyadmin.conf
# *     3) Restart apache2 when done.

LABEL maintainer="ehafidi"
RUN apk -U upgrade 

RUN apk add openrc
RUN apk add openssl
RUN apk add openssl
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
#COPY index.html /www/index.html

RUN mkdir /run/nginx

#RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/localhost.key -x509 -days 365 -out /etc/nginx/localhost.crt -subj '/CN=localhost'

COPY wp /var/www/wordpress

ADD wp.sh /setup/wp.sh

EXPOSE 5050

CMD ["/bin/ash",  "/setup/wp.sh"]