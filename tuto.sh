minikube version
minikube start
kubectl version
kubectl cluster-info
kubectl get nodes 
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1 
kubectl get deployments
kubectl proxy
curl http://localhost:8001/version
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME
kubectl get pods
kubectl describe pods
curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/
kubectl logs $POD_NAME
kubectl exec $POD_NAME env
kubectl exec -ti $POD_NAME bash
cat server.js
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080
kubectl describe services/kubernetes-bootcamp
export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT
curl $(minikube ip):$NODE_PORT
kubectl describe deployment
kubectl get pods -l run=kubernetes-bootcamp
kubectl get services -l run=kubernetes-bootcamp
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME
kubectl label pod $POD_NAME app=v1
kubectl describe pods $POD_NAME
kubectl delete service -l run=kubernetes-bootcamp
kubectl get services
kubectl get rs
kubectl scale deployments/kubernetes-bootcamp --replicas=4
kubectl get pods -o wide
kubectl describe deployments/kubernetes-bootcamp
kubectl scale deployments/kubernetes-bootcamp --replicas=2
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2
kubectl describe services/kubernetes-bootcamp
minikube ip 
