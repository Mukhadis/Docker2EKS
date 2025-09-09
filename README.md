# 🚀 Cloud-Native Application on AWS with EKS, Terraform & GitHub Actions

This project demonstrates a cloud-native application deployment on AWS using EKS (Elastic Kubernetes Service), Terraform, Docker, and GitHub Actions. It showcases modern DevOps practices for automating infrastructure provisioning, container orchestration, CI/CD pipelines, and high availability architecture.

## 📐 Architecture Overview

The solution is built on AWS VPC with the following setup:
VPC with 2 Availability Zones for high availability.
Each AZ contains:
Public Subnet (Load Balancer or NAT Gateway).
Private Subnet (EKS worker nodes).
Internet Gateway connected to the VPC.
Application Load Balancer (ALB) in AZ1 to route external traffic.
NAT Gateway in AZ2 for secure outbound internet access from private subnets.
EKS Cluster with worker nodes running containerized workloads.
CI/CD Pipeline via GitHub Actions for automated builds, tests, and deployments.
Infrastructure as Code with Terraform for reproducible and scalable deployments.

## 🛠️ Technologies Used

AWS: VPC, Subnets, ALB, NAT Gateway, EKS, IAM, Internet Gateway
Kubernetes (EKS): Orchestrating containerized applications
Docker: Containerization of the application
Terraform: Infrastructure as Code (IaC) for AWS resource provisioning
GitHub Actions: CI/CD pipeline automation

## ⚡ Features

High availability across two Availability Zones
Secure networking with private subnets for workloads
Application Load Balancer for external traffic distribution
NAT Gateway for outbound-only internet access from private workloads
Automated CI/CD pipeline with GitHub Actions
Declarative infrastructure management with Terraform

![image alt](https://github.com/Mukhadis/DevOpsProject/blob/main/ProjectDiagram.png?raw=true)

👤 Mukhadis Yaru – Aspiring Cloud/ DevOps Engineer

LinkedIn: https://www.linkedin.com/in/mukhadis-yaru/
