locals {
  name        = "Project"
  region      = "us-east-1"
  zone1       = "us-east-1a"
  zone2       = "us-east-1b"
  env         = "dev"
  eks_name    = "${local.name}-eks"
  eks_version = "1.33"


}

