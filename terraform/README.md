# EJ Best: Submission of Kuberbetes Load Balancer Project 

Submission of Project includes the following status.  Was able to get this working to an 80% to 90% of requirements.  The model from the assignment chosen is that Kubernetes builds out a Nginx container to be Load Balanced scale Nginx containers up and down in High Availability. 

Each Nginx instance does operate its own container building on the alpine:3.10 image from the public docker repository.   Each Nginx instance presents an IP address of the instance presenting.  Also, a static IP address list can be found and updated each time there is a scale up or down.  The command below can do that.
<pre>
kubectl get pods -l app=alpine -n testnamespace2 \
-o go-template='{{range .items}}{{.status.podIP}}{{"\n"}}{{end}}' \
 > static-file.txt && cat static-file.txt
</pre>


## Commnands to run code 


**Base Requirements**
 <br>
-  Linux or Mac workstation or Linux server
-  AWS Command Line and Account <br>
    https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html<br>
-  Terraform v0.14.3
    https://www.terraform.io/downloads.html
-  Git
    https://git-scm.com

**Steps suggested to make run** 
1. Go to a command line of your workstation<br>
- script was tested on Linux and Mac
<br>

git clone git@github.com:ejbest/k8lb-example.git

Run following commands to run terraform scripts

```
terraform init
terraform plan
terraform apply
```



# x Coding Exercise - DevOps Engineer #

This script when run; will create an EC2 with 2 volumes and 2 users in a single step execution.  If you are able to follow the steps; you can see the test function or my contact details are below.

2. Clone the files from git<br><br>
    git clone https://github.com/ejbest/codeexample.git<br>
<br>

3. Go to the folder that was just created<br><br>
    cd codeexample<br>
<br>

4. Execute script provide<br><br>
    ./run.sh
<br>

5. Review Console Output
-  Details showing success or fail
-  See the Deploy to virtual machine
-  Script server.py will SSH into the instance as user1 and user2
-  There will be actions to write and read on each of two volumes

6. Considering if you have access and knowledge of the AWS console
- Check on the EC2 console in the left column for "Instances"<br>
- You should see your instance with the name "myAwesomeServer"<br>
- By clicking on the InstanceID; then Storage, you will see two volumes under "Block Devices"<br>
<br>

7. In closing 
- For a time savings in research some boto3 points were done in bash<br>
- Extra attention was paid to key handling for dynamic execution<br>
<br>
Please let me know any feedback; if any quesitons arise or if anything was interpreted incorrectly.
<br>


| Contact  | EJ Best
| ------------ | -------------------------------------
| Skype | erich.ej.best
| Email | erich.ej.best@gmail.com
| Phone | 201-218-9860
| LinkedIn | https://www.linkedin.com/in/ejbest
