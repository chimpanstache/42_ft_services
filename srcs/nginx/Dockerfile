# Container OS
FROM alpine

LABEL maintainer="ehafidi"

# update software packages
RUN apk update && apk upgrade 

# install nginx
RUN apk add nginx

#creating new user, group and a directory for files
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
#RUN cat etc/nginx/nginx.conf
#RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.html /www/index.html

RUN mkdir /run/nginx
#RUN rc-service nginx start

# SSL
RUN apk add openssl
RUN openssl req -x509 -newkey rsa:2048 -keyout localhost-key.pem -days 365 -nodes -subj '/CN=localhost'
# RUN openssl req -newkey rsa:2048 -nodes -keyout localhost.key -x509 -days 365 -out localhost.crt

EXPOSE 80 443

CMD nginx -g "daemon off;"