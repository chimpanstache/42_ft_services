FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

COPY cmd.sh /setup/cmd.sh


EXPOSE 3000
# RUN grafana-server --homepath="/usr/share/grafana" --config="/etc/grafana.ini"
CMD /bin/ash /setup/cmd.sh 
#RUN  ./grafana-7.3.7pwd/grafana-server web
# RUN rc-service grafana start 
# RUN  rc-service ./grafana-7.3.7/bin/grafana-server start
# RUN ./sbin/grafana-server web

