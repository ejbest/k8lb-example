# EJ Best: Submission of Kuberbetes Load Balancer Project 

Submission of Project includes the following status.  Was able to get this working to an 80% to 90% of requirements.  The model from the assignment chosen is that Kubernetes builds out a Nginx container to be Load Balanced scale Nginx containers up and down in High Availability. 

Each Nginx instance does operate its own container building on the alpine:3.10 image from the public docker repository.   Each Nginx instance presents an IP address of the instance presenting.  Also, a static IP address list can be found and updated each time there is a scale up or down.  The command below can do that.
<pre>
kubectl get pods -l app=alpine -n testnamespace2 \
-o go-template='{{range .items}}{{.status.podIP}}{{"\n"}}{{end}}' \
 > static-file.txt && cat static-file.txt
</pre>


#### Commnands to run and test

**Base Requirements**
 <br>
-  Linux or Mac workstation or Linux server
-  AWS Command Line and Account
    https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html<br>
-  Terraform v0.14.3
    https://www.terraform.io/downloads.html
-  Git
    https://git-scm.com

**Steps** 
1. Go to a command line of your workstation<br>
<pre>
    cd mytestfolder
</pre>
- script was tested on Linux and Mac
- create a folder of your choice for the test
2. Clone the files from git
<pre>
    git clone git@github.com:ejbest/k8lb-example.git<br>
</pre>
3. Go to the folder that was just created
<pre>
    cd k8lb-example<br>
</pre>

4. CD to the Terraform Folder
<pre>
    cd terraform
    terraform init
    terraform plan
    terraform apply
</pre>

5. Go to the Applcation Folder - start apps
<pre>
cd ..
cd application
bash start-k8-app.sh 
</pre>

6. It will take time to sync with Kubernets / EKS / Nginx 
<pre>
kubectl get svc -n testnamespace2
</pre>
7. An dns name like below in the output, this will be the load balancer address
    ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com 

8. Perform a command "nslookup" passing this dns name and ensure that it only returning a positive non-failing return <br>
    nslookup ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com 

A good output would look like below 
<pre>
% nslookup ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com 
Server:		209.18.47.61
Address:	209.18.47.61#53
Non-authoritative answer:
Name:	ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com
Address: 54.210.181.93
Name:	ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com
Address: 3.229.57.142
%
</pre>

9. Two meathods to scale up and down
<pre>
kubectl scale deployment.apps/alpine --replicas=6 
</pre>
You can also edit "replicas" in alpine-deployment.yaml chosing the desired numbers.  Invoke by 
<pre>
kubectl apply -f alpine-deployment.yaml
</pre>


7. Bonus Items
##### Bonus #1 How to configure to maximize availability.
This could be an on-prem or cloud environment; and could serve a series of Web Servers that would autoscale for performance.   For example; scaling based on 50% CPU load would be with the below command.

##### Bonus #2 What loads would this spinup be able at loads would this spinup be able to handle. 
This would primarily be a webserver but could be privately configured and non-web facing for application or other related processing.  There could be other solutions for listening and processing from API or SAAS solutions.

##### Bonus #3  How would logging, security be applied. 
There is a bunch of security concerns that we should apply.
1.	Consider using a later version of Alpine.  There are expected security patches for the OS; as well as, related pipeline tools including terraform and Ngninx that could have updated versions due to security vulnerablities.
2.	Set the kubelet with the --anonymous-auth=false flag.
3.	Implement use of certificate bundles and other key flags.
4.	Use of https 443.
5.	Scanning of image all the way to “DAST” Dynamic application scanning.
6.	Ethical Hacking of the open ports and other Penetration Testing.
7.  Use any Cyber Scanning tools the company has and consider best available market scanning tools including StackRox or Aqua.
8.  Consider Cybernews Sources and other related avenues.

Please let me know any questions; if any details are missing or if anything was interpreted incorrectly.

| Contact  | EJ Best
| ------------ | -------------------------------------
| Skype | erich.ej.best
| Email | erich.ej.best@gmail.com
| Phone | 201-218-9860
| LinkedIn | https://www.linkedin.com/in/ejbest
