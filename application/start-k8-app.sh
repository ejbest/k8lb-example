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
#
# above commands are handy work 

