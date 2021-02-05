# Container OS
FROM alpine:3.12

VOLUME [ "/var/lib/mysql" ]

RUN apk update && apk upgrade

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
ADD telegraf.conf /etc/telegraf/telegraf.conf

# add software packages
RUN apk add mariadb mariadb-common mariadb-client 
RUN mkdir -p /run/mysqld && touch /run/mysqld/mysqld.sock

ADD mariadb.sh /setup/mariadb.sh
ADD database.sql /setup/database.sql

RUN mkdir -p /setup
EXPOSE 3306

CMD ["/bin/ash",  "/setup/mariadb.sh"]