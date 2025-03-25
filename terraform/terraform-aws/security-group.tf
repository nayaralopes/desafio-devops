resource "aws_security_group" "sg-allow_http_ssh" {
  name        = "desafio-devops-sg"
  description = "Allow HTTP and SSH inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress = [
    {
      description = "Allow traffic to APP"
      from_port        = 8000
      to_port          = 8000
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      self = false
      security_groups = []
      prefix_list_ids = []
    },
    {
      description      = "Allow SSH inbound traffic"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = [ "::/0" ]
      self = false
      security_groups = []
      prefix_list_ids = []
    }
  ]

  egress = [
    {
      description = "Allow All for Egress"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      self = false
      security_groups = []
      prefix_list_ids = []
    }
  ]

  tags = {
    Terraform   = var.terraform
    Environment = var.environment
    Project     = var.project_name
  }
}