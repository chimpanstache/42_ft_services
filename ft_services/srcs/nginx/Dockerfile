# Container OS
FROM alpine:3.12

# update software packages
RUN apk update && apk upgrade

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
ADD telegraf.conf /etc/telegraf/telegraf.conf
# install nginx
RUN apk add nginx 
RUN apk add --no-cache openssh

RUN adduser -D ehafidi
RUN echo "ehafidi:ehafidi" | chpasswd

#creating new user, group and a directory for files
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.html /www/index.html

RUN mkdir /run/nginx

# SSL
RUN apk add openssl
RUN apk update openssl
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/localhost.key -x509 -days 365 -out /etc/nginx/localhost.crt -subj '/CN=localhost'

COPY nginx.sh /setup/nginx.sh

EXPOSE 22 80 443

RUN /usr/bin/ssh-keygen -A 

CMD [ "/bin/ash", "/setup/nginx.sh" ]