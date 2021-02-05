
#brew install minikube
#brew install docker
#brew install docker-machine

export MINIKUBE_HOME=/Users/ehafidi/goinfre 

# echo "\n#===================================== minikube start --vm-driver=virtualbox =====================================\n"
minikube start --vm-driver=virtualbox 
eval $(minikube docker-env)

minikube addons enable dashboard
minikube addons enable metallb
minikube addons enable metrics-server 

# echo "\n#===================================== minikube dashboard &  =====================================\n"
#launch k8s dashboard on web browser
minikube dashboard & 

echo "\n#===================================== metallb =====================================\n"
#install metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f metallb/config.yaml # and not create !!!!!!!!!!

echo "\n#===================================== ftpsserver =====================================\n"

docker build -t ftps-container srcs/ftps
kubectl create -f srcs/ftps/ftps.yaml
#kubectl apply -f srcs/ftps/ftps.yaml
echo "\n#===================================== mysql =====================================\n"

docker build -t mysql-container srcs/mariadb
kubectl create -f srcs/mariadb/mariadb-svc.yaml

echo "\n#===================================== wordpress =====================================\n"
# build wordpress
docker build -t wordpress-container srcs/wordpress
kubectl create -f srcs/wordpress/wordpress.yaml
echo "\n#===================================== phpmyadmin =====================================\n"
# build phpmyadmin
docker build -t phpmyadmin-container srcs/phpmyadmin
kubectl create -f srcs/phpmyadmin/phpmyadmin.yaml


echo "\n#===================================== nginx =====================================\n"
docker build -t nginx-container srcs/nginx
kubectl create -f srcs/nginx/nginx.yaml #create a pod using the data in nginx.yaml

echo "\n#===================================== influxdb =====================================\n"
docker build -t influxdb-container srcs/influxdb
kubectl create -f srcs/influxdb/influxdb-svc.yaml

echo "\n#===================================== grafana =====================================\n"
docker build -t grafana-container srcs/grafana
kubectl create -f srcs/grafana/grafana.yaml

# kubectl exec -i `kubectl get pods | grep -o "\S*mysql\S*"` -- mysql wordpress -u root < srcs/mariadb/wordpress.sql
