# Container OS
FROM alpine:3.12

VOLUME [ "/var/lib/mysql" ]
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

# add software packages
RUN apk add mariadb mariadb-common mariadb-client 
RUN mkdir -p /run/mysqld && touch /run/mysqld/mysqld.sock

ADD mariadb.sh /setup/mariadb.sh
ADD database.sql /setup/database.sql

RUN mkdir -p /setup
EXPOSE 3306
# RUN ./usr/bin/mariadb-secure-installation

CMD ["/bin/ash",  "/setup/mariadb.sh"]