Infrastructure Deployment with Terraform
Within this directory, you will find the Terraform files used to deploy all the necessary AWS infrastructure:

variables.tf
This file defines all the variables used to build the infrastructure.

provider.tf
This file sets the AWS region where the infrastructure is built. Additionally, it specifies the Terraform version and configures AWS as the required provider.

vpc.tf
This file creates the VPC within the eu-west-1 region (Ireland). The VPC is configured to resolve DNS names, which is crucial for running containers.

subnets.tf
This file creates the subnets that reside within the VPC — two private and two public subnets. Each subnet is tagged with Kubernetes load balancer tags so that the cluster can recognize them and deploy:

- Internal load balancers for private subnets.
- Internet-facing load balancers for public subnets.

igw.tf
This file creates an internet gateway and attaches it to the VPC.

nat.tf
This file creates an Elastic IP that is attached to a NAT gateway. The NAT gateway is then placed in a public subnet.

routes.tf
This file creates routing tables for both private and public subnets.

- The default route for private subnets points to the NAT gateway.
- The default route for public subnets points to the internet gateway.

ecr.tf
This file creates an Elastic Container Registry (ECR) repository named backend-repo. An IAM policy document is attached to allow actions on the repository.

eks.tf
This file creates the EKS cluster that orchestrates the containers.

1. An IAM role is created for the EKS service to manage AWS resources.
2. The AmazonEKSClusterPolicy is attached to the IAM role, granting EKS permissions to manage EC2 instances, networking, and other resources required for the Kubernetes control plane.
3. Finally, the EKS cluster is created.

- The cluster operates in private subnets across two availability zones.
- It has no public access points, only private endpoints.
- It uses API-based authentication for cluster access.
- The creator of the cluster is granted admin permissions in Kubernetes.

node.tf
This file provisions the worker nodes for the cluster.

- IAM roles are created for the EC2 instances to assume.
- The AmazonEKSWorkerNodePolicy is attached, granting the nodes permission to connect with the EKS control plane.
- The AmazonEKS_CNI_Policy is attached to enable Kubernetes networking between pods (attach ENIs, manage security groups, etc.).
- The AmazonEC2ContainerRegistryReadOnly policy is attached so nodes can pull images from the ECR.
  Finally, the EKS node group is configured to:
- Run two EC2 instances at all times.
- Scale up to three instances under higher request volumes.
