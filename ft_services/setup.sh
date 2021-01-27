# HOMEBREW_NO_AUTO_UPDATE=1 brew install docker
# HOMEBREW_NO_AUTO_UPDATE=1 brew install docker-machine
# HOMEBREW_NO_AUTO_UPDATE=1 brew install kubectl
# HOMEBREW_NO_AUTO_UPDATE=1 brew install minikube

# export MINIKUBE_HOME=/Users/ehafidi/goinfre 

minikube start --vm-driver=virtualbox
#minikube status
eval $(minikube docker-env)

minikube addons enable dashboard
minikube addons enable metallb

minikube dashboard & #go to k8s dashboard on web browser

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f metallb/config.yaml # and not create !!!!!!!!!!

# Mariadb
#kubectl create -f srcs/mariadn/mariadb.yaml
docker build -t mysql-container srcs/mariadb
kubectl create -f srcs/mariadb/mariadb-svc.yaml

docker build -t phpmyadmin-container srcs/phpmyadmin
kubectl create -f srcs/phpmyadmin/phpmyadmin.yaml

docker build -t nginx-container srcs/nginx
kubectl create -f srcs/nginx/nginx.yaml #create a pod using the data in nginx.yaml
# docker run -it -p 80:80 -p 443:443 --name nginx-container nginx-container #no need!!!!!!!!


#kubectl delete --all deployment
#kubectl delete --all svc