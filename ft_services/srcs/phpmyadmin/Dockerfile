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

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz  ./
RUN tar -C . -xzf telegraf-1.17.2_linux_amd64.tar.gz 
RUN chmod +x telegraf-1.17.2/
# RUN find . -name "telegraf.conf"
RUN mv /telegraf-1.17.2/etc/telegraf/telegraf.conf /telegraf-1.17.2/etc/telegraf/telegraf.conf.ori
COPY telegraf.conf /telegraf-1.17.2/etc/telegraf/telegraf.conf
# ./telegraf-1.17.2/etc/telegraf/telegraf.conf
RUN mv telegraf-1.17.2/usr/bin/* /usr/local/bin/

RUN apk add openrc
RUN apk add nginx
RUN apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib \
	php7-curl php7-mbstring php7-json php7-session


#creating new user, group and a directory for files
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