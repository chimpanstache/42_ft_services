# Container OS
FROM alpine:3.12

# FTPS = FTP + SSL
# SFTP = FTP + SSH

# update software packages
RUN apk update && apk upgrade
#RUN apk add wget
#RUN apk add make
RUN apk add openssl
#RUN apk add gcc
RUN apk add openrc --no-cache
#RUN apk add --no-cache --virtual .tool-deps curl coreutils autoconf g++ libtool make 

# install pure-ftpd
#RUN apk add pure-ftpd https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-1.0.49.tar.gz --no-cache
# RUN tar -xzf pure-ftpd-1.0.49.tar.gz 

RUN apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

#RUN ls -la

#verify the status of pure-ftpd
#RUN adduser ehafidi
#RUN apk stats

#create a FTP user
RUN addgroup -S group && adduser -G group -D -S ehafidi
#next cmd is to finish
RUN adduser ehafidi && addgroup ehafidi
# #configure pure-ftpd to use the certificate above
# RUN ls -la 
# COPY pure-ftpd.conf pure-ftpd.conf.ori
# COPY pure-ftpd.conf pure-ftpd.conf
# COPY pure-ftpd.conf /etc/pure-ftpd.conf

# RUN ls -la 
# RUN ./pure-ftpd-1.0.49/configure 
# RUN make install

# generate a self-signde certificate for Pure FTPD
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/pure-ftpd.pem -x509 -days 365 -out /etc/ssl/private/pure-ftpd.pem -subj '/CN=localhost'

COPY pure-ftpd.conf pure-ftpd.conf.ori
#COPY pure-ftpd.conf pure-ftpd.conf
COPY pure-ftpd.conf /etc/pure-ftpd.conf

#RUN rc-service pure-ftpd restart
EXPOSE 21 30000-30009

# ENTRYPOINT ["/init"]

# CMD ["pure-ftpd", "/etc/pure-ftpd.conf"]
# RUN pure-ftpd &
# CMD pure-ftpd -P 192.168.99.159
# RUN pure-ftpd -Y 1 -p 30000:30009 -P 192.168.99.160
COPY scriptic.sh /exe/scriptic.sh
CMD ./exe/scriptic.sh
# # Connect FTP server from client wit filezilla using filezilla's graphic interfacels