locals {
  name   = "my-web-app"
  region = "eu-west-1"

  vpc_cidr = "10.0.0.0/16"
  azs      = ["eu-west-1a", "eu-west-1b", ]

  public_subnets  = ["10.0.0.0/24", "10.0.1.0/24"]
  private_subnets = ["10.0.2.0/24", "10.0.3.0/24"]

  tags = {
    Name         = local.name
    CreationDate = "${formatdate("YYYY-MM-DD", timestamp())}"
  }

  instance_types = ["t2.micro"]
  ami_type       = "ami-09b024e886d7bbe74"
}
