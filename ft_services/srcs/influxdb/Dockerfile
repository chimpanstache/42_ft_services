# Container OS
FROM alpine:3.12

VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8086

RUN apk update
RUN apk upgrade

RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
ADD telegraf.conf /etc/telegraf/telegraf.conf

RUN apk add influxdb
COPY influxdb.conf /etc/influxdb/influxdb.conf
ADD influxdb.sh /setup/influxdb.sh

CMD /bin/ash /setup/influxdb.sh
# ADD database.sql /setup/database.sql