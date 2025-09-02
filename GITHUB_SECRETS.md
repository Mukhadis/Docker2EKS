# Required GitHub Secrets

Configure these secrets in your GitHub repository: `Settings > Secrets and variables > Actions`

## Required Secrets

### AWS Credentials
- **`AWS_ACCESS_KEY_ID`**: Your AWS access key ID
- **`AWS_SECRET_ACCESS_KEY`**: Your AWS secret access key
- **`AWS_REGION`**: AWS region where your EKS cluster is located (e.g., `us-east-1`)

### EKS Configuration
- **`EKS_CLUSTER_NAME`**: Name of your EKS cluster

## IAM Permissions Required

Your AWS credentials need the following permissions:

### ECR Permissions
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:GetRepositoryPolicy",
                "ecr:DescribeRepositories",
                "ecr:ListImages",
                "ecr:DescribeImages",
                "ecr:BatchGetImage",
                "ecr:GetLifecyclePolicy",
                "ecr:GetLifecyclePolicyPreview",
                "ecr:ListTagsForResource",
                "ecr:DescribeImageScanFindings",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:PutImage"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "ecr:GetAuthorizationToken",
            "Resource": "*"
        }
    ]
}
```

### EKS Permissions
```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "eks:DescribeCluster",
                "eks:ListClusters"
            ],
            "Resource": "*"
        }
    ]
}
```

### Additional Requirements

1. **ECR Repository**: Create an ECR repository named `backend-repo` in your AWS account
2. **EKS Cluster**: Your EKS cluster must be running and accessible
3. **kubectl Access**: The IAM user/role must have RBAC permissions in the EKS cluster

## Testing Locally

To test the setup locally:

```bash
# Configure AWS credentials
aws configure

# Test ECR access
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <account-id>.dkr.ecr.us-east-1.amazonaws.com

# Test EKS access
aws eks update-kubeconfig --region us-east-1 --name your-cluster-name
kubectl get nodes
```
