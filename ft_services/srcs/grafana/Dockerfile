FROM alpine:3.12

EXPOSE 3000

RUN apk update && apk upgrade


RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
ADD telegraf.conf /etc/telegraf/telegraf.conf

ADD https://dl.grafana.com/oss/release/grafana-7.4.0.linux-amd64.tar.gz  ./
RUN	tar -zxvf grafana-7.4.0.linux-amd64.tar.gz
RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

RUN	rm -f grafana-7.4.0.linux-amd64.tar.gz 
RUN	mv grafana-7.4.0/bin/* /usr/local/bin/ 

COPY grafana.db /grafana-7.4.0/data/

COPY grafana.sh /exe/grafana.sh
CMD ["/bin/ash",  "/exe/grafana.sh"]
