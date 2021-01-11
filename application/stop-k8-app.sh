# Delete the applicaiton
#
kubectl delete -n testnamespace2 -f app1-deployment.yaml
kubectl delete -n testnamespace2 -f app2-deployment.yaml
kubectl delete -n testnamespace2 -f nginx-deployment.yaml
kubectl delete -n testnamespace2 -f app1-service.yaml
kubectl delete -n testnamespace2 -f app2-service.yaml
kubectl delete -n testnamespace2 -f nginx-service.yaml
#
kubectl get svc,nodes,pods -n testnamespace2
#
kubectl delete svc app1
kubectl delete svc nginx -n testnamespace2
kubectl delete svc app2 -n testnamespace2
kubectl delete svc app1 -n testnamespace2
kubectl get svc,nodes,pods -n testnamespace2
kubectl delete svc my-app1 -n testnamespace2
kubectl delete svc my-app2 -n testnamespace2
kubectl delete svc my-nginx -n testnamespace2
#
kubectl get svc,nodes,pods -n testnamespace2
kubectl delete all --all -n testnamespace2
kubectl get svc,nodes,pods -n testnamespace2



