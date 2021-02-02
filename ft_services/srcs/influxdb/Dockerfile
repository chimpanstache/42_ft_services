# Container OS
FROM alpine:3.12

# update software packages
VOLUME [ "/var/lib/influxdb" ]

EXPOSE 8086

RUN apk update
RUN apk upgrade

RUN apk add influxdb

COPY influxdb.conf /etc/influxdb/influxdb.conf

# RUN apk update && apk upgrade
# VOLUME [ "/var/lib/influxdb" ]

# RUN apk add influxdb




# COPY influxdb.conf /etc/influxdb/influxdb.conf


# EXPOSE 8086

# RUN influxd 

ADD script.sh /setup/script.sh

CMD /bin/ash /setup/init.sh
# ADD database.sql /setup/database.sql