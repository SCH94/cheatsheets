AWS Solution Architect Associate Exam Cheat Sheet
=================================================

Materials derived from Practice Exams and majority comes from Udemy course by Stephane Maarek.

Regions / Availability Zones (AZ)

*   Regions : AWS Geographical regions
*   Availability Zones (AZ) : ex (us-west-1)
*   Edge locations : each region consists of many edge location to serve cached data for frequent access to nearby users

IAM: Users & Groups

*   IAM = Identity and Access Management, Global service
*   Root account created by default, shouldn’t be used or shared
*   Users are people within organization and can be grouped
*   Groups only contain users, not other groups
*   Users don’t have to belong to a group, and user can belong to multiple groups

IAM: Permissions

*   Users or Groups can be assigned JSON documents called policies
*   These policies define the permissions of the users
*   In AWS, apply the least privilege principle: dont give more permission than user needs

IAM Policy Structures

*   Consists of
    *   Version
    *   Id
    *   Statement
        *   Sid : statement Id
        *   Effect : Allow / Deny
        *   Principal : account/user/role to which this policy applies to
        *   Action : list of action this policy allows or denies
        *   Resource : list of resources to which this actions applies to
        *   Condition : (optional) conditions for when this policy in effect

IAM Roles : assign permission to AWS service ex : EC2 instance roles, lambda function roles, roles for Cloud formation

IAM Credentials Report : report that list users and status of their credentials

IAM Access Advisor : shows the service permission granted to user and when the service last accessed

EC2 : Elastic Compute Cloud = Infrastructure as a Service

Consists the capability of

*   EC2 : renting visual machine

*   EBS : Storing data on virtual drives

*   ELB : Distribute load across machine

*   ASG : Auto scaling services

EC2 User Data : bootstrap (launching list of commands) instance using EC2 User data script (runs with root user)

EC2 Instance Types

*   General purpose (Tx, Mx) : diversity of workloads such as web servers or code repositories
*   Compute Optimized (Cx) : for compute-intensive tasks that require high performance (batch processing, gaming, high performance computing
*   Memory Optimized (Rx, Xx) : for processing large data sets in memory (business intelligence)
*   Storage Optimized : require high read and write access to large data sets on local storage (high frequency online transaction processing (OLTP) systems)

Security Groups

*   can be attached to multiple instances
*   locked down to a region / VPC combination

EC2 Instances Purchasing Options

*   On-Demand : short workload, predictable pricing (billing per second – linux, other per hours)
*   Reserved (minimum 1 year) : 75% less than on demand, more discount with more reserved period
    *   Reserved Instances : long workloads
    *   Convertible Reserved Instances : long workloads with flexible instances
    *   Scheduled Reserved Instances : (ex : every Thursday between 3-6 PM)
*   Spot Instances : short workloads, cheap, can lose instances
*   Dedicated Hosts : book entire physical server 3 year period, for compliance issue, can use existing server-bound software licenses

Elastic Network Interface (ENI) : logical component in VPC that represent virtual network card

*   Primary private IPv4, one or more secondary IPv4
*   1 elastic IP per private IP
*   1 public IP
*   1 or more security groups
*   1 mac addres

ENI can be created independently and attached on the fly on EC2 instance for failover.

ENI bound to specific AZ

EC2 Hibernate

*   If EC2 terminated, data on EBS (root) terminated (by default)
*   RAM state is preserved (RAM state is written to a file in root EBS volume)
*   Root EBS must be encrypted

EC2 Nitro

*   better performance (enhanced networking, IPv6)
*   higher speed EBS (max 64K IOPS, non-nitro is 32K IOPS)

EBS (Elastic Block Store) : a network drive that can be attached to EC2 instances while running

*   data is persisted unless EBS is attached as root to EC2
*   mounted to 1 instance at a time
*   bound to 1 AZ
*   EBS snapshot (backup of EBS at a point in time) so can be copied to another AZ

AMI (Amazon Machine Image) : custom EC2 instance

*   must create an AMI by region.
*   must copy AMI to another region to launch instance

Golden AMI : snapshot a state after application installation

EC2 Instance Store : high-performance hardware disk. however, if EC2 stopped, lose storage (ephemeral). good for buffer / cache/ temporary data

EBS volumes comes in 6 types

*   General purpose SSD (gp2, gp3) : only this can be used for boot
*   Highest performance SSD (io1, io2) : high performance for high throughput workloads
*   Low cost HDD (st1) : throughput intensive, frequent access)
*   Lowest cost HDD (sc1) : infrequent access

EBS Multi-Attach – io1 / io2 : can be attached to multiple EC2 instance in the same AZ

EBS Encryption

*   Data at rest encrypted inside the volume
*   Data inflight moving between instance and volume
*   all snapshot encrypted

EFS (Elastic File System)

*   managed NFS (network file system) can be mounted to many EC2
*   multi AZ
*   expensive (3x gp2), pay per use
*   encryption at rest using KMS
*   not compatible with Windows

RAID 0 : data shared multiple volume, RAID 1 : data duplicated multiple volume

High Availability & Scalability for EC2

*   Scalablity means that an application/system can handle greater loads by adapting
*   Vertical Scaling : Increase instance size,ex: RDS, elasticache
*   Horizontal Scaling : Increase no of instance, ie distributed systems, ex: web applications, modern applications, Autoscaling group(ASG), Load balancer
*   High Availability : run instance for same application across multi AZ, goes hand in hand with horizontal scaling. ASG with multi AZ, Load balancer with multi AZ

ELB (Elastic Load Balancing) : managed load balancer

*   Load balancer are servers that forward traffic to multiple servers downstream

__ Why use load balancer __

*   spread load across multiple downstream instances
*   expose single point of access(DNS) to your application
*   seamlessly handle failures
*   do regular health checks to instances
*   provide SSL for your website
*   High availablity

Health checks:

*   health check is done on a port and a route(/health is common)
*   enable load balancer to know if instance is available to reply to request

Types: 

*   Classic Load Balancer (CLB) : HTTP, HTTPS, TCP, SSL
    *   Health check TCP or HTTP based
    *   Fixed hostname : ex : xxx.region.elb.amazonaws.com
*   Application Load Balancer (ALB) : HTTP, HTTPS, WebSocket
    *   balancing to multiple HTTP applications across target groups
    *   health check target groups level
    *   balancing to multiple apps on same machine
    *   support redirect : ex : HTTP to HTTPS
    *   routing table based on path, hostname, query string, headers
        *   path: example.com/users, example.com/posts
	*   hostname: one.example.com, two.example.com
	*   query string, headers: example.com/users?id=123&order=false 
    *   target groups
        *   EC2 instance, ECS, lambda, IP address
*   Network Load Balancer (NLB) : TCP, TLS, UDP
    *   forward TCP & UDP to instance
    *   handle million of request per second
    *   less latency, extreme performance
    *   support elastic IP (for whitelisting specific IP)
    *   1 static IP per AZ
*   Gateway Load Balancer (GWLB) : Network Layer, IP Protocol

ELB Sticky session (for CLB and ALB) redirect same user to same instance behind load balancer

ELB support Cross-Zone Load Balancing : each load balancer instance distributed evenly across all registered instance in all AZ

ELB support SSL certificates

ELB (ALB, NLB) support SNI (Server Name Indication) which is loading multiple SSL certificates onto 1 web server

ASG (Auto Scaling Group) has the following attributes :

*   Launch configuration
    *   AMI + instance type
    *   EC2 user data
    *   EBS volumes
    *   security groups
    *   SSH keypair
*   Min / Max size, initial capacity
*   Network + subnet information
*   Load balancer information
*   Scaling policies

ASG cab auto scale based on custom metric using CloudWatch

ASG scaling policy can be CPU, Network,

To update ASG, must provide a new launch configuration / launch template

IAM roles attached to ASG will get assigned to EC2 instances

ASG Scaling Policy

*   Predictive Scaling : forecast load and schedule scaling ahead  
    

Dynamic scaling : target tracking (ex, keep average CPU at 40%, etc), step scaling, simple scaling (specify max and min threshold, but in simple, need to wait cooldown)

ASG Scaling cooldown (300 second default)

ASG termination policy : balance across AZ and delete based on age of launch configuration

AWS RDS (Relational Database Service)

*   managed DB service
*   PMMOMA (Postgre, MySQL, MariaDB, Oracle, Microsoft SQL, Aurora)
*   automated provisioning, OS patch, monitoring dashboard
*   continuous backups and restore
*   deployed in private subnet
*   RDS events only provide operational events such as DB instance events, DB parameter group events, DB security group events, and DB snapshot events
*   enable enhanced monitoring for memory and CPU
*   IAM based authentication MySQL and PostgreSQL
    *   use auth token through IAM & RDS API calls (lifetime 15 mins)

RDS Read Replicas

*   Up to 5 Read Replicas
*   within AZ, cross AZ or cross region
*   replication is async so eventually consistent
*   replica can be promoted to main DB
*   app must update connection string
*   network cost if different region. different AZ is free

RDS Multi AZ (Disaster Recovery)

*   SYNC replication
*   1 DNS name, automatic failover (no need to change connection string)
*   high availability, not for scaling

RDS Security – Encryption

*   At rest encryption (possible to encrypt master & read replica with AWS KMS)
    *   has to be defined during launch
    *   TDE (Transparent Data Encryption) available for Oracle and SQL Server
*   In-flight encryption (SSL)

Amazon Aurora

*   not open source
*   support postgre & MySQL
*   AWS cloud optimized
*   storage grows increment of 10GB up to 64 TB
*   can have 15 replicas (MySQL only has 5)
*   instant failover (HA native)
*   1 instance takes writes (master)
*   able to authenticate using IAM token

Aurora DB Cluster (writer endpoint point to master, reader endpoint to connection load balancing, and auto scaling)

Aurora – Custom Endpoint : can define subset of Aurora as custom endpoint to run ex : analytical queries

Aurora Serverless : automatic db instantiation and auto scaling based on actual usage

Aurora Multi-Master : immediate failover for High Availability (HA). every node does Read and Write instead of promoting Read Replica as new master

Global Aurora

*   Aurora Cross Region Read Replica (for disaster recovery)
*   Aurora Global Database
    *   1 primary region (R/W)
    *   up to 5 secondary (read only) region
    *   promote another region as master RTO < 1 minute

Aurora Machine Learning : enable to add ML-based prediction

*   supported : Amazon SageMaker, Amazon Comprehend

Amazon ElastiCache : managed Redis or Memcached

*   Redis : multi AZ with auto-failover, read replicas, data durability using aof persistence, backup restore
*   Memcached : multi-node for partitioning of data (sharding), no high availability, non persistent, no backup restore

ElastiCache – Redis : has redis auth, guarantee uniqueness & element ordering, ex: gaming leaderboard

Amazon Route 53 : authoritative DNS (customer can update DNS record). also domain registrar, can also check resources health

High TTL records possibly outdated records but less traffic to Route 53 (less bill)

CNAME vs Alias : AWS Resources expose an AWS hostname

*   CNAME : point a hostname to any other hostname
    *   Only for non root domain (ex : app.mydomain.com –> something.anything.com)
*   Alias : point to hostname of AWS Resource
    *   for root and non root (ex : mydomain.com –> something.amazonaws.com)
    *   free

Route 53 Routing Policy

*   Simple Routing : can return multiple value (but 1 is randomly selected by user), no health check
*   Weighted : control % of request that go to each resource
    *   can be health check
*   Latency : redirect to resource that has least latency to user based on traffic between user and AWS region
    *   can be health check
*   Failover : active – passive
*   Geolocation : based on user location, specify based on continent, country, state
*   Geoproximity : based on user location and resources. also use bias to override decision taken by route 53
*   Multivalue : route to multiple value. same with simple but have health check

Amazon S3 – Buckets

*   globally unique name
*   region level
*   multi part upload for file > 100MB
*   by default all bucket private

S3 Versioning

*   enabled at bucket level, cannot be disabled again

S3 Encryption : 4 methods

*   SSE-S3 : encrypt S3 object using key handled & managed by AWS
*   SSE-KMS : use AWS Key Management Service to manage encryption keys
*   SSE-C : manage own encryption key
*   Client Side Encryption

S3 Security & Bucket Policy

*   User based : IAM policies. can access if allowed
*   Resource based
    *   Object Access Control List (ACL)
    *   Bucket Access Control List (ACL)
*   Explicit deny take precedence

MFA Delete : force user to input Multi Factor Authentication to do important job in S3 (ex: delete, suspend versioning)

S3 Force encryption : use bucket policy to refuse API to put without encryption header or use default encryption

S3 Replication : Cross Region Replication and Same Region Replication

*   must enable versioning in source and destination
*   buckets can be different account
*   asynchronous
*   no replication chaining. if bucket 1 replicate to bucket 2, file not replicate to bucket 3

S3 pre-signed URL : valid for default 3600 second. user given pre-signed URL has same permission with user who generate pre-signed URL

S3 Storage Classes

*   S3 Standard – General Purpose : Most costly alternative with 99.99% availability (probability that the object will be available when needed) and 99.999999999% durability (probability that data will not be lost)
*   S3 Standard – Infrequent Access (IA) : This still replicates data to different AZ in a region but less costlier than standard. Retrieval fees are charged
*   One-Zone – Infrequent Access : Data stored in single AZ
*   S3 Intelligent Tiering : Storage tiering is managed by AWS instead which uses Machine learning to decide on which tier to use for the bucket based on historical patterns of usage
*   Glacier : Used when cost has to be less but time of retrieval can be configurable ranging from minutes to hours
*   Glacier Deep Archive : This is cheapest option where retrieval time of more than 12 hours is acceptable

S3 Lifecycle Rules : Can use S3 Analytics to determine when to transition Standard to Standard IA

*   LRs can be used to automatically expire objects based on prefix/tag filters (For eg. All objects having tags “_abc”_ should expire after 30 days)
*   Objects can automatically transition across different storage tiers’ based on lifecycle rules. For eg. after 30 days migrate objects to IA-1Zone and after 60 days move it to Glacier and finally expire them after 120 days

S3 Performance

*   Multipart-upload : recommended for files > 100MB, must use for > 5GB
*   S3 Transfer Acceleration : transfer file to AWS edge location to be forwarded to S3 target region
*   S3 Byte-range fetches : parallelize get by requesting specific byte range
    *   for faster download
    *   for getting header file only

S3 Select & Glacier Select

*   Retrieve less data using SQL by performing server side filtering

S3 Event Notification : chain event to other AWS service, ex : generate thumbnail for every upload

S3 Requester Pay : requester pay the cost of networking

AWS Athena

*   serverless to perform analytics directly to S3
*   charge per query and amount of data scanned

S3 Object Lock : block deletion or overwrite for specific amount of time

S3 Inventory — Reporting for auditing purposes of all S3 objects. Reports can be stored in json, yaml or parquet format

AWS Cloudfront : Content Delivery Network (CDN)

*   content cached at edge
*   DDoS protection, integration with AWS Shield, AWS Web Application Firewall
*   Cloudfront Geo restriction : Blacklist & Whitelist
*   support [\[email protected\]](/cdn-cgi/l/email-protection) that lets run Lambda closer to user

Cloudfront origin : S3 Bucket, Custom Origin (EC2, ALB, etc)

Cloudfront vs S3 Cross Region Replication

*   Cloudfront : Global Edge, File cached at TTL, great for static content
*   S3 Cross Region : setup each region that want to be replicated, dynamic content

Cloudfront Signed URL :for distributing premium files. (access to single file or URL not necessarily S3) & Signed Cookie (multiple file)  
Cloudfront : Price class all (all region), 200 (most region, exclude expensive), 100 (least expensive only)

Cloudfront Multiple Origin : route to different kind of origin (ex: ALB, S3) (based on path)

Cloudfront Origin Groups : can assign primary origin and secondary origin

Cloudfront Field Level Encryption : asymmetric, sensitive information encrypted at the edge close to user

AWS Global Accelerator :

*   leverage AWS internal network, proxy packet at the edge to application inside AWS
*   only 2 external IP to be whitelisted, health check

AWS Snow Family : AWS OpsHub to manage snow family device

*   Data migration : Snowcone (8TB), Snowball Edge (80TB), Snowmobile (<100PB)
*   Edge computing : Snowcone, Snowball Edge (compute or storage optimized)
    *   preprocess data
    *   machine learning
    *   transcoding media streams

AWS Storage Gateway : on-premise data on the cloud

*   File Gateway : File access (NFS) with active directory (backed by S3)
*   Volume Gateway : Volume/ Block Storage / iSCSI (backed by EBS)
*   Tape Gateway : VTL Tape solution (backed by S3 and Glacier)
*   No on-prem virtualization : Hardware appliances

Amazon FSx is a file system offering from AWS. It is offered in two variants:

*   FSx for Windows
*   FSx for Lustre (High performance compute)

FSx is basically a high performance file system that can be used for compute intensive workloads offering high data throughput. Users can additionally configure the throughput irrespective of the data storage size of the file system (unlike EFS)

FSx is frequently used as file storage for Windows systems as it offers SMB protocol support. Additionally, it also offers integrations with other storage services like S3, where data can be temporarily copied from S3 to AWS FSx for high throughput needs from a filesystem perspective; and later the result can be copied back to S3 after the computations are completed.

Payment model is pay-as-you-go

AWS Transfer Family : managed service for file transfer into and out of EFS, S3 using FTP

Amazon SQS (Simple Queue Service)

*   Producing : produced to SQS using SDK
    *   persisted in SQS until deleted
    *   message retention : default 4 days, max 14 days
*   Consumer : poll SQS (receive up to 10 messages at a time)

SQS Message Visibility

*   when processed, invisible to other consumer
*   default 30 seconds to be produced (visibility)

SQS Dead Letter Queues

*   if fail to process, back to queue. if exceed maximum return, go to Dead Letter Queues

SQS Delay Queues : can set delay before consumer can access the queue

SQS Queue Types  

*   Standard SQS Queue : \*This is the standard processing model for SQS service
*   FIFO SQS Queue : \*In this messages are delivered only once and also arrive in order. Maximum throughput of 300 transactions is supported

Amazon SNS (Simple Notification Service)

*   event producer send message to 1 topic
*   as many subscriber can listen (ex: SQS, lambda, etc)
*   data not persisted

*   This is push based service in contrast to SQS which is pull based
*   In order to ensure that updates are not lost, SNS messages are replicated across all AZs
*   It is immediate notification service with no delays

_Streams — Analytics — Firehose_

*   When there is a need to consume lots of streaming data on the fly, Kinesis platform can be used: for big-data, analytics and ETL. ordering at shard level

Kinesis offers three different types of services:

*   _Kinesis Streams_ : They work on shards (Shards are containers which define the logical boundaries of data storage). Streams persist the data for minimum 24 hours and maximum 7 days, so that something like Lambda or EC2 can work on this data and understand it.
    *   Each shard allows for 1 MB/s incoming data and 2 MB/s outgoing data.
*   _Kinesis Firehose_ : This is without persistence — As soon as data comes in, it has to be read/understood/processed by something like Lambda / EC2 and later the result can be stored in DynamoDB, RDS, S3 or Elastic Cluster etc.
*   _Kinesis Analytics_ : This is used for real time analytics over the data that is pushed to the Kinesis Platform

Amazon MQ (managed apache ActiveMQ) for legacy MQ

Amazon ECS (Elastic Container Service) : launch docker container on AWS, however EC2 instance must be provisioned by ourselves, policy is using IAM

Amazon Fargate : launch docker container but no EC2 to manage. use ENI

Load balancing for ECS : allow EC2 instance any port because it is randomly assigned

Load balancing for fargate : 1 task 1 IP. allow ENI security group task port from ALB security group

ECS Rolling update : when upgrade from v1 to v2, we can control minimum health percent and max percent.

Amazon ECR (Elastic Container Registry) : store, manage and deploy container on AWS, support image vulnerability scanning, version, lifecycle

Amazon EKS (Elastic Kubernates Service) : managed kubernates on the cloud.

Serverless AWS

*   Lambda
*   DynamoDB
*   AWS Cognito
*   AWS API Gateway
*   S3
*   SNS & SQS
*   Kinesis Data Firehose
*   Aurora Serverless
*   Step Function
*   Fargate

AWS Lambda

*   Virtual function, on-demand, short time execution, automated scaling
*   pay per call, pay per duration
*   Execution : memory allocation (128 – 10GB), max exec time (15 mins), disk capacity (512 MB), env variables (4KB), max deployment 250MB size

DynamoDB

*   replication across 3 AZ
*   NoSQL
*   max item size 400KB
*   made of tables, primary key, attributes
*   must have provisioned read and write capacity unit
*   Read Capacity Unit (RCU) and Write Capacity Unit (WCU)
*   can set autoscaling and has burst credit. if burst credit emply ProvisionedThroughputException
*   has Transaction (all or nothing)
*   has also on-demand (no provisioning)
*   support Global Tables (cross region replication)

DynamoDB supports DAX, to cache responses and improve time from milliseconds to microseconds

DynamoDB Streams : changes in DynamoDB (Create, update, delete) can end up in DynamoDB Streams, implement cross region replication using DynamoDB Streams

AWS API Gateway

*   Support WebSocket Protocol
*   Handle API versioning, handle different environments
*   Handle security (Authentication & Authorization)
*   Swagger / Open API import
*   API key, request throttling
*   Generate SDK and API spec
*   Transform & validate request & response
*   Leverages “Sig V4” capability where IAM credential are in headers
*   Use IAM policy authorization and attach to User / Role
*   if static data, use CloudFront

API Gateway – Endpoint Types

*   Edge-Optimized (default) : for global clients, API request routed to nearest CloudFront edge location
*   Regional : client with same region
*   private : from own VPC

AWS Cognito : give user identity to interact with application

*   Cognito User Pools : sign in functionality for app users, integrate with API gateway
    *   simple login : user pass, serverless database of users
    *   can enable federated identity (Facebook, Google, Saml)
    *   send back JWT
*   Cognito Identity Pools (Federated Identity) : provide AWS credentials to user so they can access AWS resources directly, integrate with Cognito User Pools
    *   provide direct access to AWS resource from Client Side
    *   get temporary AWS credential from Federated Identity Pool
    *   credentials come with predefined IAM policy
*   Cognito Sync : synchronize data from device to Cognito, may be deprecated and replaced by AppSync

AWS SAM : Serverless Application Model

*   Framework for developing & deploying serverless applications
*   All configuration is YAML code

Database Types

*   RDBMS (SQL, OLTP): RDS, Aurora (great for joins)
*   NoSQL : Dynamo DB, ElastiCache, Neptune (no joins, no SQL)
*   Data Warehouse (Analytics, BI): Redshift (OLAP), Athena
*   Search : ElasticSearch
*   Graphs : Neptune (display relationship between data)

Redshift

*   based on PostgreSQL but not for OLTP
*   used for OLAP online analytical processing (analytics & data warehousing)
*   BI tools such as AWS Quicksight or Tableau integrate with it
*   data loaded from S3, DynamoDB, DMS, other DB
*   Redshift Spectrum : query directly against S3
*   Redshift : Analytics / BI / Data Warehouse

AWS Glue : managed ETL (Extract, Transform, Load) service, prepare and transform data for analytics

Neptune : fully managed graph database, high relationship data, social networking, knowledge graphs (wikipedia)

ElasticSearch : search by any field

AWS CloudWatch Metrics

*   provides metrics for every service in AWS
*   dimension is an attribute of a metric
*   up to 10 dimensions per metric
*   custom metrics : ex RAM usage, disk space, no of logged in users
*   standard : 5 mins, detailed : 1 min, , high resolution : 10 sec

AWS CloudWatch Logs : applications can send logs to CloudWatch using SDK, can use filter expressions

AWS CloudWatch Logs Agent : by default, no log from EC2 go to CloudWatch, need CloudWatch agent

*   CloudWatch Logs Agent : old version, can only send to CloudWatch Logs
*   CloudWatch Unified Agent : collect additional system-level metrics such as : RAM, processes, etc

CloudWatch Alarms : trigger notification for any metric, states : OK, INSUFFICIENT\_DATA, ALARM

*   Stop, Terminate, Reboot or Recover an EC2 Instance, recover with exact same IP, instance info, etc
*   Trigger Auto Scaling Action
*   Send notif to SNS

CloudWatch Events : Intercept events from AWS services (ex : EC2 instance start, S3, CodeBuild)

*   can create schedule or Cron : ex: create an event every 4 hours
*   JSON payload created from the event and passed to a target
*   Standard CloudWatch every 5 minute, Detailed every 1 minute

Amazon EventBridge : next evolution of CloudWatch Events

*   Default event bus : generated by AWS services
*   Partner event bus : receive events from SaaS service or applications
*   Custom event bus : for own application

Amazon EventBridge Schema Registry : can analyze the events in bus and infer the schema, allow to generate code that will know in advance how data is structured in the event bus

AWS CloudTrail : provides governance, compliance and audit for AWS Account, enabled by default

*   CloudTrail is enabled by default
*   Management Event : operation performed on resources in AWS account
*   Data Event : by default data event is not logged

CloudTrail Insight : enable CloudTrail Insights to detect unusual training. analyze normal event to create baseline

AWS Config : help with auditing and recording compliance of AWS resources. helps record configuration and changes over time

view compliance of a resource over time (ex: all security group should block port 80. so view comply/non-compliant item)

AWS Config Remediations, remediate noncompliant service, AWS Config Notification : notify when someone modified something in AWS Config

CloudWatch vs CloudTrail vs Config

*   CloudWatch : performance monitoring & dashboard
    *   event & alert
    *   log aggregation & analysis
*   CloudTrail : record API call made within account by everyone
    *   can define trails for specific resources
    *   global service
*   Config : record configuration changes
    *   evaluate resources against compliance rules
    *   get timeline of changes and compliance

Amazon STS (Security Token Service) : allow to grant limited and temporary access to AWS resources

*   token valid up to 1 hour
*   AssumeRole, AssumeRoleWithSAML, AssumeRoleWithWebIdentity (use Cognito instead)

Use STS to Assume a Role

*   Define IAM Role within account or cross account
*   Define which principal can access the IAM role
*   Use STS to retrieve credentials and impersonate the IAM Role
*   valid 15 min – 1 hour

Identity Federation in AWS : let user outside AWS assume temporary role for accessing AWS resources

*   Use SAML, Amazon Cognito, SSO, AWS Microsoft AD
*   no need to create IAM users

AWS Cognito : login to federated id provider, get temporary AWS credential from Federated Identity Pool, credential come with pre-defined IAM policy

AWS Directory Services : AWS Managed AD

*   AWS Managed Microsoft AD : on-prem AD trust AWS Managed AD
*   AD Connector : Directory Gateway proxy request to on-prem AD
*   Simple AD : AD-compatible managed directory on AWS. cannot be joined with on-prem AD

AWS Organization : global service, manage multiple AWS account. main account is master

*   consolidated billing. member account can only be part of 1 organization
*   pricing benefit

Multi Account Strategies : create accounts per department, per cost center, per dev/test/prod based on regulatory restriction for better resource isolation

Service Control Policies (SCP)

*   whitelist / blacklist IAM actions
*   applied at OU or account level
*   not apply to master account
*   SCP must have explicit allow
*   Hierarcy : Master –> OU –> Account level

When assume a role, you give up your original permission and take the permission assigned to the role

When using a resource based policy, principal doesn’t have to give up permissions

Deny evaluation –> organization scp –> resource based policy –> IAM permission boundary –> session policies –> identity based policies

AWS Resource Access Manager (RAM)

*   Share AWS resource that you own with other AWS accounts
*   share with any account or within organization
*   License Manager Configurations
*   VPC subnets (allow to have all resources in the same subnet)

AWS SSO (Single Sign-On)

*   Centrally managed Single Sign-On to access multiple accounts and third party business application
*   Integrated with AWS organization
*   SAML markup
*   integration with on-prem Active Directory
*   centralized permission and auditing

Amazon KMS (Key Management Service) : AWS managed the key for encryption. fully integrated with IAM

*   symmetric & asymmetric
*   Customer Master Key (CMK) (AWS default managed CMK, user key created in KMS, user key imported)

KMS Automatic Key Rotation : for customer managed CMK. if enabled, happen every 1 year.

KMS Manual Key Rotation : rotation every 90.180 days etc. solution for CMK not eligible for automatic (ex: asymmetric CMK)

KMS Key Policy : control access to KMS CMK

Use Key Alias to hide changes of key for the application. app only know the alias.

SSM Parameter Store

*   secure storage for configuration and secret
*   serverless, scalable, durable
*   version tracking available
*   able to assign TTL to a parameter

AWS Secrets Manager

*   storing secrets
*   capable of force rotation of secret every x days
*   integration with Amazon RDS, encrypted using KMS
*   mostly meant for RDS

CloudHSM : AWS provisions encryption hardware. user manage own encryption keys entirely, must use CloudHSM Client Software

AWS Shield :

*   AWS Shield Standard : free for every AWS customer
*   AWS Shield Advanced : optional DDoS mitigation service , protect against higher fees during usage spikes due to DDoS

AWS WAF (Web Application Firewall)

*   Protect web application from common web exploits HTTP
*   Deploy on ALB, API Gateway, CloudFront
*   Define Web ACL (Web Access Control List)
    *   Rules : IP address, HTTP headers, URI
    *   protect from SQL injection, XSS

AWS Firewall Manager : manage rules in all accounts of AWS organization, common set of security rules, WAF rules, AWS shield advanced

Amazon GuardDuty : intelligent threat discovery (using machine learning)

*   input data includes (cloudtrail logs, VPC flow logs, DNS logs)
*   can protect against cryptocurrency attacks

AWS Inspector : only for EC2 instance, network assessment, host assestment (common vulnerabilites & exposures). if EC2 instance have vulnerabilites.

Amazon Macie : fully managed data security and privacy service that uses machine learning & pattern matching to discover and protect sensitive data in AWS

AWS Shared Responsibility Model

*   AWS responsibility (security of the cloud) : infrastructure
*   Customer responsibility (security in the cloud) : EC2 instance patches, encryption

CIDR subnet mask

*   /32 = 2^0 = 1
*   /31 = 2^1 = 2
*   /24 : last IP number can change (ex 192.160.0.0/24 –> 192.168.0.0 – 192.168.0.255)
*   /16 : last 2 number can change
*   /8 : last 3
*   /0 : all number can change

Private IP range

*   10.0.0.0 – 10.255.255.255 (10.0.0.0/8)
*   172.16.0.0 – 172.31.255.255 (172.16.0.0/12)
*   192.168.0.0 – 192.168.255.255 (192.168.0.0/16)

Default VPC

*   all new accounts have a default VPC
*   new instance launched into default VPC if no subnet specified
*   default VPC have internet and all instances have public IP

VPC in AWS – IPv4

*   5 VPC max per region (soft limit)
*   Max CIDR per VPC = 5, min size /28, max size 16
*   Max CIDR : 16
*   VPC is private, only private IP ranges are allowed
*   IP should not overlap with other networks (ex: corporate)

Subnets – IPv4

*   AWS reserves 5 IP (first 4 and last 1) in each subnet.

Internet Gateway

*   1 VPC attached to 1 IGW
*   created separately from VPC

NAT Instance (Network Address Translation)

*   allows instance in the private subnet to connect to internet
*   must be launched in the public subnet
*   must have elastic IP attached
*   route table must be configured to route traffic from private subnet to NAT instance

NAT Gateway

*   AWS managed NAT, higher bandwidth, better availability no admin
*   requires IGW (Private Subnet –> NAT –> IGW)
*   no security group
*   created in specific AZ, uses Elastic IP
*   highly available not fault tolerant

DNS Resolution in VPC

*   enableDnsSupport : if true, query AWS DNS server
*   enableDnsHostname : true by default for default VPC, if true, assign public hostname to EC2 instance if it has a public hostname

NACL & Security Group : Network Access Control List

*   NACL : firewall which control traffic from and to subnet
*   1 NACL per subnet
*   Default NACL allow all inbound and outbound
*   ephemeral ports : 1024 – 65535
*   security group : instance level, stateful (return traffic automatic allowed), nacl : subnet level, (return traffic explicitly allowed)

VPC Peering

*   Connect 2 VPC privately using AWS network, behave as if same network
*   must not have overlapping CIDR
*   not transitive
*   Route table must be updated in both VPC that are peered

VPC Endpoints

*   allow to connect to AWS service using private network instead of public
*   remove the need of IGW, NAT, etc to access AWS services
*   Interface –> provision ENI (private address) as an entry point) to most AWS services
*   Gateway –> provision a target and must be used in a route table – S3 and DynamoDB

VPC Flow logs : capture info about IP traffic going into interface, monitor & troubleshoot connectivity issues, capture network info from AWS managed interfaces too. can be queried using Athena

Bastion Hosts

*   use a bastion host to SSH into private instances
*   public subnet which is then connected to other private subnets
*   bastion host security group must be tightened
*   make sure bastion host only has port 22 traffic from the IP needed, not from security groups of other instances

Site to Site VPN

*   Virtual Private Gateway : VPN concentrator on the AWS side of VPN connection
    *   VGW is created and attached to the VPC from which you want to create site-to-site VPN connection
*   Customer Gateway : software app/physical device on customer side of the VPN connection

Direct Connect (DX) : provides a dedicated private connection from a remote network to VPC

*   Dedicated Direct support 100 Gbps & 10 Gbps
*   Hosted connection : 50 Mbps, 500 Mbps, 10 Gbps

Egress only Internet Gateway : for IPv6 only, similar function as NAT.

*   IPv6 all public addresses
*   give IPv6 instance access to internet but not directly reachable by internet

AWS Private Link (VPC Endpoint Services)

*   most secure & scalable to expose a service to 1000s of VPC
*   requires NLB (Service VPC) and ENI (Customer VPC)
*   dont want to expose app to internet and other VPC but can be used by other customer

AWS VPN CloudHub

*   Provide secure communication between sites if you have multiple VPN connections
*   Low cost hub-and-spoke model
*   allow to securely communicate with multiple sites using AWS VPN

Transit Gateway : Site to site VPN ECMP (Equal-cost multi-path routing)

*   routing strategy to allow to forward a packet over multiple best path
*   use case : create multiple site-to-site VPN connection to increase bandwidth of connection to AWS

IPv6 in VPC

*   IPv4 cannot be disabled for VPC and subnet
*   get private internal IPv4 and public IPv6

Disaster Recovery

*   RPO : Recovery Point Objective (how far behind data can be loss)
*   RTO : Recovery Time Objective (downtime)

Disaster Recovery Strategies

*   Backup and Restore (High RPO)
*   Pilot Light : small version of app always running on cloud, useful for critical core
*   warm standby : full system up and running but minimum size, scale to production upon disaster
*   multi site / hot site approach : full production scale on AWS and on prem

DMS (Database Migration Service)

*   must create EC2 instance to perform replication
*   source DB remain available during migration
*   quickly and securely migrate database to AWS
*   CDC (Continuous Data Replication)

AWS Schema Conversion Tool (SCT) : convert one engine to another

On Premise strategy with AWS

*   able to download amazon linux 2 AMI as VM
*   VM import / export
*   AWS Application Discovery Service : gather info on on-prem server to plan migration
    *   track with AWS migration hub
*   AWS Server Migration Service (SMS) : incremental replication of on-prem live server to AWS

AWS DataSync : move large amount of data from on-prem to AWS S3, EFS, Amazon FSx

AWS Backup : centrally manage and automate backup across AWS services, support cross-account backup

Elastic Fabric Adapter (EFA) : network interface for EC2 instances that enable customer to run applications requiring high level of inter-node communications.

CloudFormation : outline AWS infrastructure (Infrastructure as code)

*   destroy and recreate infrastructure on the cloud on the fly
*   automated generation of diagram
*   declarative programming

CloudFormation – StackSets : create, update delete stacks across multiple accounts and regions with a single operation

AWS Step Functions : serverless visual workflow to orchestrate Lambda functions

AWS SWF (Simple Workflow Service)

*   coordinate work amongst application
*   runs on EC2
*   has human intervention step

Amazon EMR (Elastic MapReduce) : helps creating hadoop clusters (big data) to analyze and process vast amount of data

AWS CodeCommit (GitHub), CodeBuild (Jenkins), AWS CodeDeploy, AWS CodePipeline

AWS Opsworks : chef/puppet –> help perform server configuration

AWS Workspace : Managed, Secure Cloud Desktop, eliminate management of VDI (Virtual Desktop Infrastructure)

AppSync : store and sync data across mobile and web apps
