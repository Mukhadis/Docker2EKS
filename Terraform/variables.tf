locals {
  name        = "project"
  region      = "eu-west-1"
  zone1       = "eu-west-1a"
  zone2       = "eu-west-1b"
  env         = "dev"
  eks_name    = "${local.name}-eks"
  eks_version = "1.33"


}

