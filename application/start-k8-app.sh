#start-k8-app..sh
set -x
# reconfigure kubectl
aws eks --region us-east-1 update-kubeconfig --name terraform-eks-demo 
#
# Create namespace2
kubectl create namespace testnamespace2

kubectl apply -n testnamespace2 -f alpine-deployment.yaml
kubectl apply -n testnamespace2 -f alpine-service.yaml
kubectl expose deployment alpine --type=LoadBalancer --port=80 --name=my-alpine -n testnamespace2

kubectl get svc,nodes,pods,deployments -n testnamespace2

kubectl get pods -l app=alpine -n testnamespace2 \
    -o go-template='{{range .items}}{{.status.podIP}}{{"\n"}}{{end}}' > static-file.txt && cat static-file.txt

# kubectl apply -n testnamespace2 -f app1-deployment.yaml
# kubectl apply -n testnamespace2 -f app1-service.yaml
# kubectl expose deployment app1 --port=5000 --type=LoadBalancer --name=my-app1 -n testnamespace2

# kubectl apply -n testnamespace2 -f app2-deployment.yaml
# kubectl apply -n testnamespace2 -f app2-service.yaml
# kubectl expose deployment app2 --port=5000 --type=LoadBalancer --name=my-app2 -n testnamespace2

# kubectl apply -n testnamespace2 -f nginx-deployment.yaml
# kubectl apply -n testnamespace2 -f nginx-service.yaml
# kubectl expose deployment nginx --type=LoadBalancer --port=80 --name=my-nginx -n testnamespace2

