module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "${local.name}-eks"
  kubernetes_version = "1.33"

  endpoint_public_access = true

  # EKS Auto Mode configuration
  compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Create IAM service role for EKS cluster
  iam_role_name = "${local.name}-eks-cluster-role"
  iam_role_additional_policies = {
    AmazonEKSClusterPolicy = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  }

  tags = {
    Name : "DevOpsProject0-EKS"
    CreationDate : "${formatdate("YYYY-MM-DD", timestamp())}"
  }
}

# IAM role policy attachment for ECR access
resource "aws_iam_role_policy_attachment" "eks_ecr_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = module.eks.cluster_iam_role_name
}

# Additional IAM policy for ECR token authorization (if needed for cross-account access)
resource "aws_iam_role_policy" "eks_ecr_token_policy" {
  name = "${local.name}-eks-ecr-token-policy"
  role = module.eks.cluster_iam_role_name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken"
        ]
        Resource = "*"
      }
    ]
  })
}

