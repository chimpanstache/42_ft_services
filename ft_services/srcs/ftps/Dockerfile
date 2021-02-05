# Container OS
FROM alpine:3.12

# FTPS = FTP + SSL
# SFTP = FTP + SSH

RUN apk update && apk upgrade


RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
ADD telegraf.conf /etc/telegraf/telegraf.conf

RUN apk add openssl
RUN apk add pure-ftpd --repository=http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /etc/ssl/private
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/pure-ftpd.pem -x509 -days 365 -out /etc/ssl/private/pure-ftpd.pem -subj '/CN=localhost'

RUN adduser -D ehafidi
RUN echo "ehafidi:ehafidi" | chpasswd

EXPOSE 21 30000-30004

COPY ftps.sh /exe/ftps.sh
CMD ["/bin/ash",  "/exe/ftps.sh"]
# # Connect FTP server from client wit filezilla using filezilla's graphic interfacels