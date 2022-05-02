Getting Started
---------------

### kubernetes on AWS

ECS(elastic conatiner service):
container Orchestration
cluster is required

EKS(Elastic kubernetes service):
Managed kubernetes platform by aws
cluster is required

FARGATE:
container-on-demand
cluster is not required.

### Kubernetes installation options

Development:
* minikube
* docker for desktop

Unmanaged:
* kubeadm
* kops
* kubespray

Managed:
* AKS: Azure kubernetes service
* EKS: Elastic kubernetes service aws
* GKE: google kubernetes engine
* OKE: oracle container engine for kubernetes


### AWS Fargate

AWS Fargate lets developers build and deploy containerized applications without having to manage any underlying infrastructure. It reduces a lot of the friction involved with being able to deploy applications. We did a deep dive on Fargate earlier which is available [here](https://www.learnaws.org/2019/09/14/deep-dive-aws-fargate/).

### Elastic Kubernetes Service (EKS)

EKS is Amazon’s fully managed Kubernetes Service that lets people run Kubernetes on AWS without having to manage the Kubernetes control plane. It reduces the operational overhead that comes with having to manage and run the control plane.

### What is the benefit of EKS on Fargate?

To run pods, EKS requires worker nodes running on EC2 instances. EKS recently announced support for [managed node groups](https://aws.amazon.com/about-aws/whats-new/2019/11/amazon-eks-adds-support-for-provisioning-and-managing-kubernetes-worker-nodes/) which lets users provision worker nodes for the EKS cluster from the CLI or the console. However, this feature is only available to clusters running on Kubernetes version 1.14.

EKS on Fargate removes the need for provisioning any EC2 instances. Amazon manages the lifecycle of the pod and spins up a Fargate worker node to run your pods. You are only billed for the amount of time the pod is running.

It is also possible to have a hybrid cluster where certain applications are run on EC2 worker nodes and others on Fargate.

There are certain limitations with running applications on Fargate:

*   There is a maximum of 4 vCPU and 30Gb memory per pod.
*   No support for stateful workloads that require persistent volumes yet.
*   Only load balancer that is supported is the Application Load balancer.

How to setup an EKS cluster on Fargate
--------------------------------------

Prerequisites
-------------

The following tools will be used during the tutorial:

*   [eksctl](https://eksctl.io/introduction/installation/): Official CLI to create a new EKS cluster.
*   [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/): CLI to interact with the kubernetes API server
*   [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) + [Docker](https://docs.docker.com/v17.09/engine/installation/): We will use Docker and the AWS CLI to build and push a Docker image for our application.

Setting up
----------

### Installing eksctl

* curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
* sudo mv /tmp/eksctl /usr/local/bin
* eksctl version

### INstalling kubectl

depending upon kubernetes version download kubectl

* curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.6/2022-03-09/bin/linux/amd64/kubectl 
* chmod +x ./kubectl
* mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
* echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
* kubectl version --short --client

### Create a new EKS cluster with Fargate

The following command creates a new EKS cluster named `fargate-tutorial-cluster` with Fargate enabled. Creating a new cluster can take almost _15-20 minutes_ to finish so be patient once you run this.

    eksctl create cluster \
    --name fargate-tutorial-cluster \
    --version 1.14 \
    --region us-east-2 \
    --fargate \
    --alb-ingress-access
    
    

A deeper look into the command we ran above:

*   `name`: Name of the cluster we want to create
*   `region`: Only allowed regions for EKS on Fargate currently are: US East (N. Virginia), US East (Ohio), Europe (Ireland), and Asia Pacific (Tokyo)
*   `fargate`: This creates a [Fargate profile](https://docs.aws.amazon.com/eks/latest/userguide/fargate-profile.html), which is used to run Kubernetes pods as Fargate tasks. This fargate profile has access to the `default` and `kube-system` namespaces
*   ALB ingress access: EKS on Fargate only supports the Application Load Balancer (ALB) so this flag helps setup some of the scaffolding required to setup an ALB to work with EKS.

To learn more about what this command is doing under the hood, see `eksctl create cluster --help`

If everything is setup correctly, you should see output like this:

    [ℹ] eksctl version 0.11.1
    [ℹ] using region us-east-2
    [ℹ] setting availability zones to [us-east-2b us-east-2c us-east-2a]
    [ℹ] subnets for us-east-2b - public:192.168.0.0/19 private:192.168.96.0/19
    [ℹ] subnets for us-east-2c - public:192.168.32.0/19 private:192.168.128.0/19
    [ℹ] subnets for us-east-2a - public:192.168.64.0/19 private:192.168.160.0/19
    [ℹ] using Kubernetes version 1.14
    [ℹ] creating EKS cluster "fargate-tutorial-cluster" in "us-east-2" region with Fargate profile
    [ℹ] if you encounter any issues, check CloudFormation console or try 'eksctl utils describe-stacks --region=us-east-2 --cluster=fargate-tutorial-cluster'
    [ℹ] CloudWatch logging will not be enabled for cluster "fargate-tutorial-cluster" in "us-east-2"
    [ℹ] you can enable it with 'eksctl utils update-cluster-logging --region=us-east-2 --cluster=fargate-tutorial-cluster'
    [ℹ] Kubernetes API endpoint access will use default of {publicAccess=true, privateAccess=false} for cluster "fargate-tutorial-cluster" in "us-east-2"
    [ℹ] 1 task: { create cluster control plane "fargate-tutorial-cluster" }
    [ℹ] building cluster stack "eksctl-fargate-tutorial-cluster-cluster"
    [ℹ] deploying stack "eksctl-fargate-tutorial-cluster-cluster"
    [✔] all EKS cluster resources for "fargate-tutorial-cluster" have been created
    [✔] saved kubeconfig as "/Users/abhishek.ray/.kube/config"
    [ℹ] creating Fargate profile "fp-default" on EKS cluster "fargate-tutorial-cluster"
    [ℹ] created Fargate profile "fp-default" on EKS cluster "fargate-tutorial-cluster"
    [ℹ] "coredns" is now schedulable onto Fargate
    [ℹ] "coredns" is now scheduled onto Fargate
    [ℹ] "coredns" pods are now scheduled onto Fargate
    [ℹ] kubectl command should work with "/Users/abhishek.ray/.kube/config", try 'kubectl get nodes'
    [✔] EKS cluster "fargate-tutorial-cluster" in "us-east-2" region is ready
    

You can confirm that the cluster is up and running successfully by running the following command. You should see that the nodes should say something like `fargate-ip-`.

    kubectl get nodes
    NAME STATUS ROLES AGE VERSION
    fargate-ip-192-168-104-74.us-east-2.compute.internal Ready <none> 2m15s v1.14.8-eks
    fargate-ip-192-168-189-108.us-east-2.compute.internal Ready <none> 2m23s v1.14.8-eks
    
    

run the following command and note the `VPC Id` for the cluster

    eksctl get cluster --region us-east-2 --name fargate-tutorial-cluster -o yaml
    

You should see output like the following, something like `VPC Id` is `vpc-0d6db56df56a24df4`.

    - Arn: arn:aws:eks:us-east-2:945568844480:cluster/fargate-tutorial-cluster
    ...
    Name: fargate-tutorial-cluster
    PlatformVersion: eks.5
    ResourcesVpcConfig:
    ClusterSecurityGroupId: sg-05fcf3f946eb02905
    EndpointPrivateAccess: false
    EndpointPublicAccess: true
    SecurityGroupIds:
    - sg-096e4003269513e35
    SubnetIds:
    - subnet-04d862001fbde9988
    - subnet-03b8282166aa15ee2
    - subnet-0016581d3ee8f9084
    - subnet-0c2be351682b1781d
    - subnet-07f5209ad5776a11c
    - subnet-07ca8bec32d9e5c38
    VpcId: vpc-0d6db56df56a24df4
    RoleArn: arn:aws:iam::945568844480:role/eksctl-fargate-tutorial-cluster-cluste-ServiceRole-MRI84BGGOYKB
    Status: ACTIVE
    Tags: {}
    Version: "1.14"
    

### Setup the AWS ALB ingress controller

Next, we will setup the [AWS ALB Ingress controller](https://github.com/kubernetes-sigs/aws-alb-ingress-controller) so that we can allow external traffic to access our application.

Download these two maifest files locally:

    wget https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.4/docs/examples/rbac-role.yaml
    wget https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.1.4/docs/examples/alb-ingress-controller.yaml
    

*   The `rbac_role` manifest gives appropriate permissions to the ALB ingress controller to communicate with the EKS cluster we created earlier.
*   The ALB ingress controller creates an [Ingress Controller](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/) which uses ALB.

Before we can apply these manifests, we need to uncomment and edit the following fields in the ALB Ingress Controller manifest:

*   `cluster-name`: The name of the cluster. In this case, we will use `fargate-tutorial-cluster`.
*   `vpc-id`: VPC ID of the cluster. We saw how to access this field in the section above.
*   `aws-region`: The region for your EKS cluster.
*   `AWS_ACCESS_KEY_ID`: The AWS access key id that ALB controller can use to communicate with AWS. For this tutorial, we will add the access key in plaintext in the file. However, for a production setup, it is recommended to use a project like [kube2iam](https://github.com/jtblin/kube2iam) for providing IAM Access.
*   `AWS_SECRET_ACCESS_KEY`: The AWS secret access key id that ALB controller can use to communicate with AWS. For this tutorial, we will add the access key in plaintext in the file. However, for a production setup, it is recommended to use a project like [kube2iam](https://github.com/jtblin/kube2iam) for providing IAM Access.

### Deploy the modified alb-ingress-controller

Once the appropriate fields have been added to the ingress controller, we can go ahead and create those resources on the cluster.

    kubectl apply -f rbac-role.yaml
    
    clusterrole.rbac.authorization.k8s.io/alb-ingress-controller created
    clusterrolebinding.rbac.authorization.k8s.io/alb-ingress-controller created
    serviceaccount/alb-ingress-controller created
    
    

    kubectl apply -f alb-ingress-controller.yaml
    deployment.apps/alb-ingress-controller created
    

After applying the manifests, you can check the status of the ingress controller and you should be able to see logs like this:

    
    kubectl logs -n kube-system $(kubectl get po -n kube-system | egrep -o "alb-ingress[a-zA-Z0-9-]+")  
    -------------------------------------------------------------------------------
    AWS ALB Ingress controller
    Release: v1.1.3
    Build: git-0db46039
    Repository: https://github.com/kubernetes-sigs/aws-alb-ingress-controller.git
    -------------------------------------------------------------------------------
    
    W1215 23:13:50.174793 1 client_config.go:549] Neither --kubeconfig nor --master was specified. Using the inClusterConfig. This might not work.
    I1215 23:13:50.234381 1 controller.go:121] kubebuilder/controller "level"=0 "msg"="Starting EventSource" "controller"="alb-ingress-controller" "source"={"Type":{"metadata"
    :{"creationTimestamp":null}}}
    I1215 23:13:50.234756 1 controller.go:121] kubebuilder/controller "level"=0 "msg"="Starting EventSource" "controller"="alb-ingress-controller" "source"={"Type":{"metadata"
    :{"creationTimestamp":null},"spec":{},"status":{"loadBalancer":{}}}}
    
    I1215 23:13:50.235812 1 leaderelection.go:205] attempting to acquire leader lease kube-system/ingress-controller-leader-alb...
    I1215 23:13:50.251098 1 leaderelection.go:214] successfully acquired lease kube-system/ingress-controller-leader-alb
    I1215 23:13:50.351574 1 controller.go:134] kubebuilder/controller "level"=0 "msg"="Starting Controller" "controller"="alb-ingress-controller"
    I1215 23:13:50.451834 1 controller.go:154] kubebuilder/controller "level"=0 "msg"="Starting workers" "controller"="alb-ingress-controller" "worker count"=1
    
    

### Setup a Python web application

For this tutorial, we will setup a simple Python web application which can be found at [https://github.com/abhishekray07/fargate-web-app](https://github.com/abhishekray07/fargate-web-app).

This webapp returns `Hello, world!` whenever a request is made.

#### Clone the repo

First, we will clone the sample repo and use that as the application we want to deploy to the EKS cluster. This repository also contains the Kubernetes manifests required for our application.

    git clone https://github.com/abhishekray07/fargate-web-app/
    

#### Create a new repo on AWS Elastic Container Registry (ECR)

Next, we will create a new repository to store our Docker images.

    aws ecr create-repository --repository-name fargate-tutorial
    {
    "repository": {
    "repositoryArn": "arn:aws:ecr:us-east-2:945568844480:repository/fargate-tutorial",
    "registryId": "945568844480",
    "repositoryName": "fargate-tutorial",
    "repositoryUri": "945568844480.dkr.ecr.us-east-2.amazonaws.com/fargate-tutorial",
    "createdAt": 1576452024.0,
    "imageTagMutability": "MUTABLE",
    "imageScanningConfiguration": {
    "scanOnPush": false
    }
    }
    }
    

Copy the `repositoryUri` from above as we will need to build our docker image.

#### Build a Docker image

To be able to deploy our application onto Kubernetes, we need to create a Docker image for our application. The following commands will create a new Docker image and add the appropriate tag to the image so that it can be used by our EKS cluster.

    docker build -t fargate-tutorial:1 .
    docker tag fargate-tutorial:1 945568844480.dkr.ecr.us-east-2.amazonaws.com/fargate-tutorial:1
    
    

#### Push the Docker image

We need to push the Docker image to ECR so that it can be accessed by the EKS cluster.

Before we can push the image to ECR, we need to authenticate the Docker CLI. Run the following command and note the output of the command.

    aws ecr get-login --region us-east-2 --no-include-email
    

Output:

    docker login -u AWS -p password https://aws_account_id.dkr.ecr.us-east-2.amazonaws.com
    

Copy and paste the output from above and you should see something like: `Login Succeeded`

Once you have logged in successfully, you should now be able to push your Docker image using:

    docker push 945568844480.dkr.ecr.us-east-2.amazonaws.com/fargate-tutorial:1
    

### Deploy Application to EKS Cluster

There are 4 manifest files under the `kubernetes` folder in the repository linked above. These files are:

*   `Namespace`: Creates a new [Namespace](https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/) for our application
*   `Deployment`: Creates a [Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) object for our application
*   `Service`: Creates a [Service](https://kubernetes.io/docs/concepts/services-networking/service/) object for our application
*   `Ingress`: Setup [ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) for the application so that it is accessible externally

First, we need to create a new [Fargate profile](https://docs.aws.amazon.com/eks/latest/userguide/fargate-profile.html) since we will be using a new namespace for our application. EKS on Fargate by default only supports pods running in the `default` and `kube-system` namespaces.

    eksctl create fargateprofile --namespace python-web --cluster fargate-tutorial-cluster --region us-east-2
    

Output:

    [ℹ] creating Fargate profile "fp-38ddf319" on EKS cluster "fargate-tutorial-cluster"
    [ℹ] created Fargate profile "fp-38ddf319" on EKS cluster "fargate-tutorial-cluster"
    

Once, the Fargate profile is created, we can create a new namespace for our application:

    kubectl apply -f namespace.yaml
    

    kubectl get ns
    
    NAME STATUS AGE
    default Active 55m
    kube-node-lease Active 55m
    kube-public Active 55m
    kube-system Active 55m
    python-web Active 8s
    

Then, we create a service for our application:

    kubectl apply -f service.yaml
    

    kubectl get svc -n python-web
    
    NAME TYPE CLUSTER-IP EXTERNAL-IP PORT(S) AGE
    python-web NodePort 10.100.67.103 <none> 80:32026/TCP 9s
    
    

Next, we will create the deployment for the application:

    kubectl apply -f deployment.yaml
    

The pod will initially be in a `Pending` state and will eventually become `Ready` if we can bring it up successfully.

    kubectl get pods -n python-web
    
    NAME READY STATUS RESTARTS AGE
    python-web-5744b776c5-2xrvw 0/1 Pending 0 9s
    

    kubectl get pods -n python-web
    
    NAME READY STATUS RESTARTS AGE
    python-web-5744b776c5-2xrvw 1/1 Running 0 94s
    

Lastly, we will apply ingress manifest to expose our application to the public internet.

    kubectl apply -f kubernetes/ingress.yaml
    

To check the status of the ingress, we can run the following command. Note the `Address` in the output since this is public URL for our application.

    
    kubectl describe ing -n python-web python-web
    Name: python-web
    Namespace: python-web
    Address: e577236e-pythonweb-pythonw-0d03-909174416.us-east-2.elb.amazonaws.com
    Default backend: default-http-backend:80 (<none>)
    Rules:
    Host Path Backends
    ---- ---- --------
    *
    / python-web:80 (192.168.129.142:8080)
    Annotations:
    alb.ingress.kubernetes.io/scheme: internet-facing
    alb.ingress.kubernetes.io/target-type: ip
    kubectl.kubernetes.io/last-applied-configuration: {"apiVersion":"extensions/v1beta1","kind":"Ingress","metadata":{"annotations":{"alb.ingress.kubernetes.io/scheme":"internet-facing","alb.ingress.kubernetes.io/target-type":"ip","kubernetes.io/ingress.class":"alb"},"name":"python-web","namespace":"python-web"},"spec":{"rules":[{"http":{"paths":[{"backend":{"serviceName":"python-web","servicePort":80},"path":"/"}]}}]}}
    
    kubernetes.io/ingress.class: alb
    Events:
    Type Reason Age From Message
    ---- ------ ---- ---- -------
    Normal CREATE 7s alb-ingress-controller LoadBalancer e577236e-pythonweb-pythonw-0d03 created, ARN: arn:aws:elasticloadbalancing:us-east-2:945568844480:loadbalancer/app/e5
    77236e-pythonweb-pythonw-0d03/f13c5996185584eb
    Normal CREATE 6s alb-ingress-controller rule 1 created with conditions [{ Field: "path-pattern", Values: ["/"] }]
    

The ALB can take a few minutes to be functional. Once it is functional, we should be able to access it by hitting the endpoint:

    curl http://e577236e-pythonweb-pythonw-0d03-909174416.us-east-2.elb.amazonaws.com
    
    Hello, World!
    

Congrats, your web application is up and running on Kubernetes.

#### (Optional) Deleting the cluster

Finally, you can run the following command to delete the cluster we just created.

    eksctl delete cluster --region=us-east-2 --name fargate-tutorial-cluster
    

