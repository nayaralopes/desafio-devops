resource "aws_instance" "desafio-devops-ec2" {
  count                  = var.servers
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = ["${aws_security_group.sg-allow_http_ssh.id}"]
  key_name               = var.key_pair_name

  tags = {
    Name        = var.instance_name[count.index]
    Terraform   = var.terraform
    Environment = var.environment
    Project     = var.project_name
  }
}