# HOMEBREW_NO_AUTO_UPDATE=1 brew install docker
# HOMEBREW_NO_AUTO_UPDATE=1 brew install docker-machine
# HOMEBREW_NO_AUTO_UPDATE=1 brew install kubectl
# HOMEBREW_NO_AUTO_UPDATE=1 brew install minikube

# export MINIKUBE_HOME=/Users/ehafidi/goinfre 

minikube start --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-30000
#minikube status
minikube mount ${PWD}/srcs/grafana/config:srcs/grafana
kubectl apply -R -f /srcs/ 

#docker-env is now inside cluster and not on machine
eval $(minikube docker-env)

minikube addons enable dashboard
minikube addons enable metallb

#launch k8s dashboard on web browser
minikube dashboard & 

#install metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f metallb/config.yaml # and not create !!!!!!!!!!

# build ftps server
docker build -t ftps-container srcs/ftps
kubectl create -f srcs/ftps/ftps.yaml
#kubectl apply -f srcs/ftps/ftps.yaml

# build mysql server
kubectl create -f srcs/mariadb/mariadb-vol.yaml
docker build -t mysql-container srcs/mariadb
kubectl create -f srcs/mariadb/mariadb-svc.yaml

# build wordpress
docker build -t wordpress-container srcs/wordpress
kubectl create -f srcs/wordpress/wordpress.yaml

# build phpmyadmin
docker build -t phpmyadmin-container srcs/phpmyadmin
kubectl create -f srcs/phpmyadmin/phpmyadmin.yaml

# build nginx webserver

docker build -t nginx-container srcs/nginx
kubectl create -f srcs/nginx/nginx.yaml #create a pod using the data in nginx.yaml
# docker run -it -p 80:80 -p 443:443 --name nginx-container nginx-container #no need!!!!!!!!

# build influxdb database
# kubectl create -f srcs/influxdb/influxdb-vol.yaml
docker build -t influxdb-container srcs/influxdb
kubectl create -f srcs/influxdb/influxdb-svc.yaml
kubectl exec -i `kubectl get pods | grep -o "\S*influxdb\S*"` -- influx -execute "CREATE DATABASE ehafidi"

#build grafana
docker build -t grafana-container srcs/grafana
kubectl create -f srcs/grafana/grafana.yaml

kubectl exec -i `kubectl get pods | grep -o "\S*mysql\S*"` -- mysql wordpress -u root < srcs/mariadb/wordpress.sql
# kubectl exec -i $(kubectl get pods | grep mysql | cut -d" " -f1) -- mysql wordpress -u root < srcs/mariadb/wordpress.sql

#kubectl delete --all deployment
#kubectl delete --all svc