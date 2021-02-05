# Container OS
FROM alpine:3.12

LABEL maintainer="ehafidi"

# update software packages
RUN apk update && apk upgrade

# ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz  ./
# RUN tar -C . -xzf telegraf-1.17.2_linux_amd64.tar.gz 
# RUN chmod +x telegraf-1.17.2/
# # RUN find . -name "telegraf.conf"
# RUN mv /telegraf-1.17.2/etc/telegraf/telegraf.conf /telegraf-1.17.2/etc/telegraf/telegraf.conf.ori
# COPY telegraf.conf /telegraf-1.17.2/etc/telegraf/telegraf.conf
# # ./telegraf-1.17.2/etc/telegraf/telegraf.conf
# RUN mv telegraf-1.17.2/usr/bin/* /usr/local/bin/

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
RUN ls -la

COPY nginx.sh /setup/nginx.sh

EXPOSE 22 80 443

RUN /usr/bin/ssh-keygen -A 

CMD [ "/bin/ash", "/setup/nginx.sh" ]