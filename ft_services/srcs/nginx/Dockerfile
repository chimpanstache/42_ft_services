# Container OS
FROM alpine:3.12

LABEL maintainer="ehafidi"

# update software packages
RUN apk update && apk upgrade
# RUN export HTTP_PROXY_AUTH=basic:*:proxy_user:proxy_password
# RUN export HTTP_PROXY=http://proxy_host:proxy_port
# RUN export HTTPS_PROXY=http://proxy_host:proxy_port

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

# RUN  echo "proxy_set_header Host $http_host;" > /etc/nginx/proxy_params
# RUN echo "proxy_set_header X-Real-IP $remote_addr;" >> /etc/nginx/proxy_params
# RUN echo "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;" >> /etc/nginx/proxy_params
# RUN echo "proxy_set_header X-Forwarded-Proto $scheme;" >> /etc/nginx/proxy_params 
#RUN cat etc/nginx/nginx.conf
#RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY default.conf /etc/nginx/conf.d/default.conf
COPY index.html /www/index.html

RUN mkdir /run/nginx
#RUN rc-service nginx start

# SSL
RUN apk add openssl
RUN apk update openssl
# RUN echo 'user:password' | chpasswd
#RUN openssl req -x509 -newkey rsa:2048 -keyout localhost-key.pem -days 365 -nodes -subj '/CN=localhost'
# RUN openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -nodes -subj '/CN=localhost'
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/localhost.key -x509 -days 365 -out /etc/nginx/localhost.crt -subj '/CN=localhost'
RUN ls -la
# RUN cd etc/
# RUN ls -la
# RUN find ~ -name "localhost.crt" -print

COPY start.sh /setup/start.sh

EXPOSE 22 80 443

RUN /usr/bin/ssh-keygen -A 

CMD [ "/bin/ash", "/setup/start.sh" ]