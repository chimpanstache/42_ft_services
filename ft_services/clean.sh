kubectl delete --all deployments
kubectl delete --all pods
kubectl delete --all services
kubectl delete --all pvc
kubectl delete --all pv
# docker image rm influxdb-container
# docker image rm mysql-container
# docker image rm nginx-container
# docker image rm wordpress-container
# docker image rm ftps-container
# docker image rm phpmyadmin-container
# docker image rm grafana-container

minikube stop && minikube delete
rm -rf /Volumes/Storage/goinfre/ehafidi/.minikube