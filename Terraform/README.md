Within this directory you will find the terrafrom code to do the following:

vpc.tf:
This terraform file creates the virtual private cloud on AWS that will have the EKS cluster within it. It consists of a private subnet that will hace the EKS fargate pods deployed too and a public subnet that holds a NAT gateway which allows the pods to download containers from DockerHub

eks.tf:
This terraform file creates and EKS cluster in fargate mode. This simplifies the configuration for what is a small webapp that does not require a lot of resources which may incur higher charges.

variables.tf
This file just holds the variables required in both the vpc and eks files.
