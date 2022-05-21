EKS Cluster Introduction
---

EKS cluster 
* eks control plane
* worker nodes & node group
* fargate profile 
* vpc

EKS control plain(master node)

* etcd
* kube apiserver
* kube controller
* managed by aws

Worker nodes & node groups

* group of ec2 instances where we run our application workloads

Fargate profile

* run application on serverless fargate profile

VPC(virtual private cloud)

* with vpc we follow secure networking standards which will allow us to run production workload on eks
* fargate profiles run on private subnets

__ How does EKS work? __

provision eks cluster -> deploy worker node -> connect to eks -> run kubernetes app

__EKS cluster - core objects details__

EKS control plane

```
1. eks runs a single tenant kubernetes control plane for each cluster, and control plane infrastructure is not shared across cluster or aws accounts

2. contains atleast 2 api server nodes and 3 etcd nodes, running accross three Availablity Zones within region

3. Automatically detect and replaces ubhealthy control plane instances, restarting them accross the AZ within the region as needed

```

Worker Nodes

```
1. worker nodes run in aws and connect to cluster control plane via cluster API server endpoint

2. Node group is one or more EC2 instances that are deployed in EC2 Autoscalling group

3. All instance in a node group must

* Be the same instance type
* running same AMI
* use same EKS worker node IAM role

```
Fargate profile

```
1. provides on-demand right sized compute capacity for containers

2. no longer have to provision, configure, or scale groups of virtual machines to run containers

3. each pod running in fargate has its own isolation boundary and does not share the underlying kernel,cpu, memory resources or elastic network interface with another pod.

4. Fargate controller that recognizes the pods belonging to fargate and schedule them
```

VPC

```
1. VPC network policies to restrict traffic between control plane components to within a single cluster

2. controlplane components cannot view or recieve communication from other clusters or other aws account except as authorized with kubernetes RBAC policies

```




