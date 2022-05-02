# kubernetes on AWS
  ECS(elastic conatiner service):
  container Orchestration
  cluster is required

  EKS(Elastic kubernetes service):
  Managed kubernetes platform by aws
  cluster is required

  FARGATE:
  container-on-demand
  cluster is not required.

## Kubernetes installation options
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

## AWS Elastic Kubernetes Service
  EKS can be deployed in two ways
  * command line utility called eksctl
  * using console, aws cli

## How to setup EKS cluster on Fargate

### Prerequisites

  The following tools will be used during the tutorial:

  * eksctl: Official CLI to create a new EKS cluster.
  * kubectl: CLI to interact with the kubernetes API server
  * AWS CLI + Docker: We will use Docker and the AWS CLI to build and push a Docker image for our application.

##  Setting up

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

### Creating EKS cluster with fargate

  * eksctl create cluster --name fargate-tutorial-cluster --version 1.14 --region us-east-2 --fargate --alb-ingress-access

If every thing went okay the output should be
  * [✔] EKS cluster "fargate-tutorial-cluster" in "us-east-2" region is ready
  
confirm that the cluster is up and running successfully

  * kubectl get nodes -o wide

  |NAME|                                                    STATUS   |ROLES    |AGE     |VERSION              |INTERNAL-IP       |EXTERNAL-IP   |OS-IMAGE         |KERNEL-VERSION                  |CONTAINER-RUNTIME|
  |-------------|-------------|-------------|-------------|-------------|-------------|-------------|-------------|-------------|-------------|
|fargate-ip-192-168-141-147.region-code.compute.internal |Ready    |<none>   |8m3s    |v1.22.6-eks-7c9bda   |192.168.141.147   |<none>        |Amazon Linux 2   |5.4.156-83.273.amzn2.x86_64   |containerd://1.3.2
|fargate-ip-192-168-164-53.region-code.compute.internal  |Ready    |<none>   |7m30s   |v1.22.6-eks-7c9bda   |192.168.164.53    |<none>        |Amazon Linux 2   |5.4.156-83.273.amzn2.x86_64   |containerd://1.3.2|

run the following command and note the VPC Id
  * eksctl get cluster --region us-east-2 --name fargate-tutorial-cluster -o yaml

should see output like the following
  ```
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
  ```

