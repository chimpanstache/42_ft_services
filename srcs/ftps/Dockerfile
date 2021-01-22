# Container OS
FROM alpine:3.12

# update software packages
RUN apk update && apk upgrade
RUN apk add wget
RUN apk add make
RUN apk add openssl

#RUN apk add -y gcc-c++
#RUN apk add xcode

# install pure-ftpd
#RUN apk add https://pkgs.alpinelinux.org/package/edge/testing/x86/pure-ftpd
#ENV PUREFTPD_VERSION="1.0.49"

RUN wget http://yum.baseurl.org/download/3.4/yum-3.4.3.tar.gz
RUN wget https://download.pureftpd.org/pub/pure-ftpd/releases/pure-ftpd-1.0.49.tar.gz 

RUN tar -xzf pure-ftpd-1.0.49.tar.gz 

RUN tar -xzf yum-3.4.3.tar.gz
RUN yum -y gcc-c++



#verify the status of pure-ftpd
RUN apk stats

#create a FTP user

#WORKDIR /pure-ftpd-1.0.49
RUN ls -la 
RUN pwd

#RUN addgroup -S group && adduser -S -D ehafidi -G group
RUN addgroup -S group && adduser -G group -D -S ehafidi
RUN ls -la 
WORKDIR /pure-ftpd-1.0.49
RUN ls -la 
RUN ./configure 
# RUN cat config.log
RUN make install

# #press enter and Y

# # generate a self-signde certificate for Pure FTPD
# RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/pure-ftpd.key -x509 -days 365 -out /etc/ssl/private/pure-ftpd.crt -subj '/CN=localhost'
# # RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -days 365

# #configure pure-ftpd to use the certificate above
# RUN ls -la 
# #RUN find / -name "*.conf" 
# RUN cat /etc/sysctl.conf
# COPY /etc/conf.d/pure-ftpd.conf /etc/conf.d/pure-ftpd.conf.ori
# COPY pure-ftpd.conf /etc/pure-ftpd/pure-ftpd.conf

# #restart pure-ftpd service to apply changes
# RUN systemctl restart pure-ftpd

# # Connect FTP server from client wit filezilla using filezilla's graphic interface