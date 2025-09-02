module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "${local.name}-eks"
  kubernetes_version = "1.33"

  endpoint_public_access = true

  compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  tags = {
    Name : "DevOpsProject0-EKS"
    CreationDate : "${formatdate("YYYY-MM-DD", timestamp())}"
  }
}
