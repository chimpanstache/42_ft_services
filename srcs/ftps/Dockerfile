# Container OS
FROM alpine:3.12

# update software packages
RUN apk -U upgrade 

# install pure-ftpd
RUN apk add pure-ftpd

# verify the status of pure-ftpd
RUN systemctl status pure-ftpd

#create a FTP user
RUN adduser ehafidi

#press enter and Y

# generate a self-signde certificate for Pure FTPD
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/pure-ftpd.key -x509 -days 365 -out /etc/ssl/private/pure-ftpd.crt -subj '/CN=localhost'
# RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -days 365

#cponfigure pure-ftpd to use the certificate above
