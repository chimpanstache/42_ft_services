# Container OS
FROM alpine:3.12

# update software packages
VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8086

RUN apk update
RUN apk upgrade
RUN apk add influxdb

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz  ./
RUN tar -C . -xzf telegraf-1.17.2_linux_amd64.tar.gz 
RUN chmod +x telegraf-1.17.2/
# RUN find . -name "telegraf.conf"
RUN mv /telegraf-1.17.2/etc/telegraf/telegraf.conf /telegraf-1.17.2/etc/telegraf/telegraf.conf.ori
COPY telegraf.conf /telegraf-1.17.2/etc/telegraf/telegraf.conf
# ./telegraf-1.17.2/etc/telegraf/telegraf.conf
RUN mv telegraf-1.17.2/usr/bin/* /usr/local/bin/

COPY influxdb.conf /etc/influxdb/influxdb.conf
ADD influxdb.sh /setup/influxdb.sh

CMD /bin/ash /setup/influxdb.sh
# ADD database.sql /setup/database.sql