# Container OS
FROM alpine:3.12

VOLUME [ "/var/lib/mysql" ]
# update software packages
RUN apk update && apk upgrade

# add software packages
RUN apk add mariadb mariadb-common mariadb-client 

#RUN ls -la /var/lib/mysql/

RUN mkdir -p /run/mysqld && touch /run/mysqld/mysqld.sock

ADD cmd.sh /setup/cmd.sh
ADD database.sql /setup/database.sql

RUN mkdir -p /setup
EXPOSE 3306
# RUN ./usr/bin/mariadb-secure-installation

CMD ["/bin/ash",  "/setup/cmd.sh"]