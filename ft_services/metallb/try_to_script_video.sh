# kubectl create deploy nginx --image nginx
# kubectl expose deploy nginx --port 80 --type LoadBalancer # expose the deployment as a service to access it from outside the cluster
# kubectl delete svc nginx 
#-------previous steps just to show that process is pending because no loadbalancer installed

#kubectl -n kube-system get all # check if we're running kube-proxy and if it is in IPVS mode
#kubectl -n kube-system get cm #to check config maps
#kubectl -n kube-system describe cm kube-proxy | less # to access the kubeproxy config map, mode: "" means no ipvs, so don't have to turn strict ARP to true
#----previous steps to check if the metallb prerequisites were good

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
#kubectl -n metallb-system get all
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
#kubectl -n metallb-system get all # to check if controller is a deployment and speaker a daemonset
#kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" #to create secret
