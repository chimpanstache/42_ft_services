FROM alpine:3.12

EXPOSE 3000

RUN apk update && apk upgrade
RUN apk add wget
# RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN wget https://dl.grafana.com/oss/release/grafana-7.4.0.linux-amd64.tar.gz 
RUN	tar -zxvf grafana-7.4.0.linux-amd64.tar.gz
RUN apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

RUN	rm -f grafana-7.4.0.linux-amd64.tar.gz 
# RUN	mv grafana-7.4.0/ grafana/ 
RUN	mv grafana-7.4.0/bin/* /usr/local/bin/ 

ADD https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz  ./
RUN tar -C . -xzf telegraf-1.17.2_linux_amd64.tar.gz 
RUN chmod +x telegraf-1.17.2/
# RUN find . -name "telegraf.conf"
RUN mv /telegraf-1.17.2/etc/telegraf/telegraf.conf /telegraf-1.17.2/etc/telegraf/telegraf.conf.ori
COPY telegraf.conf /telegraf-1.17.2/etc/telegraf/telegraf.conf
# ./telegraf-1.17.2/etc/telegraf/telegraf.conf
RUN mv telegraf-1.17.2/usr/bin/* /usr/local/bin/

COPY grafana.sh /exe/grafana.sh
CMD ["/bin/ash",  "/exe/grafana.sh"]
