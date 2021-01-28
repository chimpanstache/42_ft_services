# Container OS
FROM alpine:3.12

# FTPS = FTP + SSL
# SFTP = FTP + SSH

# update software packages
RUN apk update && apk upgrade
RUN apk add openssl
RUN apk add openrc --no-cache
RUN apk add sudo

RUN apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
# RUN find . -name "nologin"
RUN addgroup ftpgroup
RUN adduser --disabled-password ftpuser --home ftpgroup
#RUN cat /etc/passwd


# generate a self-signde certificate for Pure FTPD
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/pure-ftpd.pem -x509 -days 365 -out /etc/ssl/private/pure-ftpd.pem -subj '/CN=localhost'

RUN find . -name "pure-ftpd.conf"
RUN mv /etc/pure-ftpd.conf /etc/pure-ftpd.conf.ori
COPY pure-ftpd.conf /etc/pure-ftpd.conf

#RUN rc-service --help
RUN rc-service pure-ftpd restart --ifstarted
# EXPOSE 21 30000-30009

COPY scriptic.sh /exe/scriptic.sh
CMD ./exe/scriptic.sh
# # Connect FTP server from client wit filezilla using filezilla's graphic interfacels