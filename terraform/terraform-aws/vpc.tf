module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "desafio-devops-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway      = false
  enable_vpn_gateway      = false
  map_public_ip_on_launch = true
  enable_dns_hostnames    = true

  tags = {
    Terraform   = var.terraform
    Environment = var.environment
  }
}