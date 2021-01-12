#### EJ Best: Submission of Kuberbetes Load Balancer Project 

The following model builds High Availability, Load Balancing Nginx servers in Kubernetes containers in response to the interview assignment.

Each Nginx instance operates its own container building on the alpine:3.10 image from the public docker repository.  Each Nginx instance presents an IP address of the instance presenting.  Also, a static IP address list can be found and updated each time there is a scale up or down.  The command below can make a static file for addition to a web page or report or console has instructions below.

In an effort to differentiate my approach and showcase how I become a valuable member of the team; the model uses Terraform to build Elastic Kubernetes Service (EKS) on Amazon AWS.  The assignment encourages this type of customization so I hope to impress some of my experience on you.

#### Commnands to run and test

**Base Requirements**
 <br>
-  Mac workstation or Linux workstation/server to commandline control the testing exercise.
-  AWS Command Line and Account and authenticated<br>
    https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html<br>
-  Terraform v0.14.3<br>
    https://www.terraform.io/downloads.html
-  Git Client<br>
    https://git-scm.com

**Steps** 
1. Go to a command line of your workstation
- script was tested on Linux and Mac
- create and go to a folder of your choice for the test
<pre>
    mkdir mytestfolder
    cd mytestfolder
</pre>
2. Clone the files from git
<pre>
    git clone git@github.com:ejbest/k8lb-example.git
</pre>
3. Go to the folder that was just created
<pre>
    cd k8lb-example
</pre>
4. Change Directory to the Terraform Folder and run the following commands
<pre>
    cd terraform
    terraform init
    terraform plan
    terraform apply
    # check for output for success or error messages
</pre>
5. Go to the Applcation Folder - start apps
<pre>
    cd ..
    cd application
    bash start-k8-app.sh 
    # this will setup a namespace called tempnamespace2
    # there will be a loadbalancer setup and a set of containers
    # the number of containers will be set per the replicas setup in the configuration
    # check for output for success or error messages
</pre>
6. It will take time to sync with Kubernetes / EKS / Nginx, use the below command to check.
<pre>
    kubectl get svc -n testnamespace2
    # this will get the output of the environment
    # you will need to get the DNS name near the Load Balancer
</pre>
7. A DNS name like below in the output, this will be the load balancer address.  This DNS name is key.
<pre>
    ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com 
</pre>
8. Perform a command "nslookup" passing the DNS name and ensure that it is only returning a positive non-failing return <br>
<pre>
    nslookup ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com 
</pre>
#####       A good output would look like below 
<pre>
    % nslookup ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com 
    Server:     209.18.47.61
    Address:    209.18.47.61#53
    Non-authoritative answer:
    Name:	ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com
    Address:    54.210.181.93
    Name:	ad90a511ddb594a29beadcbe1efe67ad-594569592.us-east-1.elb.amazonaws.com
    Address:    3.229.57.142
    %
</pre>
    Use the DNS name and copy/paste into a browser such a Chrome or Firefox.
    An IP address of the load balancer that is behind the browser.
    You can start browsers and see multiple browsers and see different Ip addresses used.
    The IP address that you see in the browser is the IP of the Pod that Nginx is serving from.

9. Two methods to scale up and down<br>
Command line 
<pre>
    kubectl scale deployment.apps/alpine --replicas=6 -n tempnamespace2
</pre>
You can also edit "replicas" in alpine-deployment.yaml choosing the desired numbers.  Invoke by: 
<pre>
    kubectl apply -f alpine-deployment.yaml -n tempnamespace2
</pre>
10. Get a list of IPs in a static text file of Nginx nodes.  This list could be brought into an addition to a web page or report or console for diagnostics or otherwise. 
<pre>
    kubectl get pods -l app=alpine -n testnamespace2 \
    -o go-template='{{range .items}}{{.status.podIP}}{{"\n"}}{{end}}' \
    > static-file.txt && cat static-file.txt
</pre>
-------------------------------------------------
#### Bonus Items
##### Bonus #1 How to configure to maximize availability?
We could scale up an on-prem or cloud environment; and expand the server load.  We could serve a series of Servers that would autoscale for performance.  There is frameworks and controls around autoscaling.  For example; scaling based on 50% CPU load would maximize availabiltiy for example.  We can use similar commands like below. 
<pre>
kubectl autoscale deployment alpine-deployment --cpu-percent=50 --min=1 --max=10 -n tempnamespace2
</pre>
The command would result in scaling up more servers as per the settings of the command.

##### Bonus #2 What loads would this spinup and be able to handle?
The above spinup in the example would increase the load as much as 10 times.  There could be a variety of server needs running in Pods such a Web Presentation, Application Program Interface (API) or other Software as a Service (SAAS) solutions.

##### Bonus #3  How would logging, security be applied?
1.	Consider using a later version of Alpine.  There are expected security patches for the OS; as well as, related pipeline tools including Terraform and Ngninx that could have updated versions due to security vulnerablities.
2.	Set the kubelet with the --anonymous-auth=false flag.
3.	Implement use of certificate bundles, other key flags and encryption key solutions.
4.	Use of https 443.
5.	Ethical Hacking of the open ports and other Penetration Testing.
6.  Scanning of image all the way to “DAST” Dynamic application scanning; tools such as Tenable Nessus, CrowdStrick, Kenna, Aqua, StackRox or other related scanning tools.
7.  Consider Cybernews Sources and other related avenues, for up to date Vulnerability News.
8.  Have a solution for organized logging by some in-house modular scripts or enterprise solution with Splunk, DataDog or other related software product.
9. Have monitoring setup via Prometheus, Grafana, Rancher, Nagios, Pager Duty or other similar Monitoring applications.
10. The whole of the deployment operation should be Orchestrated in a Jenkins or similar Orchestration solutions, single execution and logged with "error-checked" deployments.

Please let me know any questions; if any details are missing or if anything was interpreted incorrectly.

| Contact  | EJ Best
| ------------ | -------------------------------------
| Skype | erich.ej.best
| Email | erich.ej.best@gmail.com
| Phone | 201-218-9860
| LinkedIn | https://www.linkedin.com/in/ejbest
