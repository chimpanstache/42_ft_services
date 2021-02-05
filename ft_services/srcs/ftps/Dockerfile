# Container OS
FROM alpine:3.12

# FTPS = FTP + SSL
# SFTP = FTP + SSH

# update software packages
RUN apk update && apk upgrade
RUN apk add openssl
RUN apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz  ./
RUN tar -C . -xzf telegraf-1.17.2_linux_amd64.tar.gz 
RUN chmod +x telegraf-1.17.2/
# RUN find . -name "telegraf.conf"
RUN mv /telegraf-1.17.2/etc/telegraf/telegraf.conf /telegraf-1.17.2/etc/telegraf/telegraf.conf.ori
COPY telegraf.conf /telegraf-1.17.2/etc/telegraf/telegraf.conf
# ./telegraf-1.17.2/etc/telegraf/telegraf.conf
RUN mv telegraf-1.17.2/usr/bin/* /usr/local/bin/

# generate a self-signde certificate for Pure FTPD
RUN mkdir -p /etc/ssl/private
RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/private/pure-ftpd.pem -x509 -days 365 -out /etc/ssl/private/pure-ftpd.pem -subj '/CN=localhost'

RUN adduser -D ehafidi
RUN echo "ehafidi:ehafidi" | chpasswd

EXPOSE 21 30000-30004

COPY ftps.sh /exe/ftps.sh
CMD ["/bin/ash",  "/exe/ftps.sh"]
# CMD /usr/sbin/pure-ftpd -Y 2 -p 30000:30004 -P 192.168.99.133
# # Connect FTP server from client wit filezilla using filezilla's graphic interfacels