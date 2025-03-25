variable "ami" {
    default = "ami-084568db4383264d4" # ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250305
}

variable "environment" {
    default = "dev"
} 

variable "instance_name" {
    type = list(string)
    default = ["app"]
}

variable "instance_type" {
    default = "t2.micro"
}

variable "key_pair_name" {
    default = "desafio-devops-keypair"
}

variable "project_name" {
    default = "Desafio DevOps"
}

variable "servers" {}

variable "terraform" {
    default = "true"
}