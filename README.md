#Sample Load Balancing 
## aws client must be configured
<pre>
git clone 
cd k8lb
cd terraform 
terraform init
terraform plan
terrraform apply --auto-approve
cd ..
bash start-k8-apps.sh
kubectl get pods
nslookup <url for load balancer - when works put in browser>
</pre>
 
Next Steps
 1. Security Groups
 2. Shutdown Clean
 3. Comments in Files
 4. How to automate a Demo Showing (Quicktime?)
 5. Document how to Build, Run and Test

Bonus 
 1. How would this be configured to maximize availability. (documentation only)
 2. What loads would this spinup be able to handle. (documentation only)
 3. How would logging, security be applied. (documentation only)










Minikube 
<pre>
minikube delete --all --purge
minikube start --driver=virtualbox
minikube status
kubectl get pods
kubectl get service
minikube addons enable ingress

aws sts get-caller-identityexit
kubectl get svc,nodes,pods
aws eks list-clusters


</pre>
https://docs.aws.amazon.com/eks/latest/userguide/getting-started-console.html
https://docs.aws.amazon.com/eks/latest/userguide/create-kubeconfig.html

 #### How to use :
 - To launch the APP, just open a terminal, go inside the unzipped folder, at the same level with docker-compose.yml, and execute : docker-compose up
 - This will spin up the dockerised architecture. After that, you need to open a browser and tape : http://localhost:8080
 - It will redirect 60% traffic to app1 and 40% traffic to app2.
 - To quit, you can just CTRL + C in the terminal and it will stop the application and destroy the created containers.




### Make sure app1 and app2 upload to dockerhub.com because kubernetes will pull image from dockerhub.
#### Login to your dockerhub

```
$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: dwinurhadi17
Password:
WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store
Login Succeeded
$
```

#### Build app1 and app2
From your root directory

App1
```
$ cd app1/
$ ls
app1.py  Dockerfile  requirements.txt
$ docker build . -t dwinurhadi17/app1 <dwi nurhadi is my dockerhub login>
$ docker push dwinurhadi17/app1
The push refers to repository [docker.io/dwinurhadi17/app1]
f170c705b2cd: Pushed
242394429f55: Pushed
15db690b672a: Pushed
dcb6780f323d: Mounted from library/python
0c8f6111ef94: Mounted from library/python
5aeaca4916d7: Mounted from library/python
59840d625c92: Mounted from library/python
da87e334550a: Mounted from library/python
c5f4367d4a59: Mounted from library/python
ceecb62b2fcc: Mounted from library/python
193bc1d68b80: Mounted from library/python
f0e10b20de19: Mounted from library/python
latest: digest: sha256:c8313494555d16bc9b9f736cbee2ca69ec3e9d02d81847aec52e6ce3c7f52fab size: 2842
$ 
```

App2

```
$ cd app2
$ ls
app1.py  Dockerfile  requirements.txt
$ docker build . -t dwinurhadi17/app2 <dwi nurhadi is my dockerhub login>
$ docker push dwinurhadi17/app2
The push refers to repository [docker.io/dwinurhadi17/app1]
f170c705b2cd: Pushed
242394429f55: Pushed
15db690b672a: Pushed
dcb6780f323d: Mounted from library/python
0c8f6111ef94: Mounted from library/python
5aeaca4916d7: Mounted from library/python
59840d625c92: Mounted from library/python
da87e334550a: Mounted from library/python
c5f4367d4a59: Mounted from library/python
ceecb62b2fcc: Mounted from library/python
193bc1d68b80: Mounted from library/python
f0e10b20de19: Mounted from library/python
latest: digest: sha256:c8313494555d16bc9b9f736cbee2ca69ec3e9d02d81847aec52e6ce3c7f52fab size: 2842
$
```
### After image is push to dockerhub

We apply kubernetes file

App1

```
$ kubectl apply -f app1-deployment.yaml
deployment.apps/app1 created
$ kubectl get pods
NAME                     READY   STATUS    RESTARTS   AGE
app1-564d657f7d-zgjnb    1/1     Running   0          5s
nginx-78d84d56fd-5vkht   1/1     Running   0          8m34s
```

Cek pod and service

```
$ kubectl get pod
NAME                     READY   STATUS    RESTARTS   AGE
app1-564d657f7d-zgjnb    1/1     Running   0          28m
app2-7ff5c7f7bc-dm94r    1/1     Running   0          7s
nginx-78d84d56fd-5vkht   1/1     Running   0          36m
$ kubectl get svc
NAME         TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
app1         ClusterIP      10.100.227.33    <none>        5001/TCP       37m
app2         ClusterIP      10.104.70.105    <none>        5002/TCP       3m23s
kubernetes   ClusterIP      10.96.0.1        <none>        443/TCP        37m
lb-nginx     LoadBalancer   10.106.126.244   <pending>     80:32317/TCP   24m
nginx        ClusterIP      10.103.112.46    <none>        8080/TCP       36m
$ 
```
