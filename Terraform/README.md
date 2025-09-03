Within this directory you will find the terrafrom files used to deploy all the necessary AWS infrastructure:

vpc.tf
This file creates the VPC within the us-east-1 region. The VPC is enabled to resolve DNS names. This is crucial for runnning containers.
