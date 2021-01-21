#commands to set up the cluster
brew update #  
brew install minikube # minikube automatically install kubectl and docker
export MINIKUBE_HOME=/Users/ehafidi/goinfre 
minikube version # check version of minikube
kubectl version # check version of kubectl
minikube start --vm-driver=virtualbox #pas utiliser hyperkit
kubectl get nodes #kubectl cli to configure the minikube cluster
minikube status #minikube to start up/deleting the cluster
minikube delete #delete cluster
minikube start --vm-driver=virtualbox --v=7 alsologtostderr # start cluster in debug mode

#commands to do things in the created cluster
kubectl get nodes #to check nodes in the cluster
kubectl get services #to check the services
kubectl create -h #create components
kubectl create deployment NAME --image=image #deployment = abstraction layer over a pod ==>blueprint to create pod #most basic configuration for deployment
kubectl create deployment nginx-depl --image=nginx #download the latest nginx image from dockerhub 
kubectl get deployment #list deployment created
kubectl edit deployment name #edit deployment, modify .yaml file
kubectl get pod # list pod 
kubectl get replicaset # list replicaset #between deployment and pod =>layer replicaset #replicaset is managing replicas of a pod
#we're working with deployments directly not replicaset 
# pod name = NAME-replicasetID-podID
# replicaset name = NAME-replicasetID

#layers of abstraction =>deployment manages a replicaset, replicaset manages all replicas of the pod, pod is an abstraction of a container 
#everything below deployment managed automatically by kubernetes

kubectl exec -it <podname> -- bin/bash # enter inside the application container as root
docker exec -ti cc55da85b915 /bin/sh # enter inside the application container as root
kubectl delete -f deployment <name> #delete deployment
kubectl apply -f <filename> #takes the configuration file (.yaml) as a parameter and execute it
#k8s know when it should create or update a deployment 
#an updated deployment generates a new pod, the previous still running
kubectl describe service-name #to get the target port, endpoints...
#endpoints are ip-addresses:target-port of the pods
kubectl get pod -o wide #gives further infos about pods
kubectl get deployment name -o yaml #> name-result.yaml # resulting in yaml format
kubectl get ns #kubectl get namespace