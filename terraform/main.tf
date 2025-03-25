provider "aws" {
  region  = "us-east-1"
}

module "terraform-aws" {
  source = "./terraform-aws"
  servers = 1
}