terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "dev" {
    count = 1
    ami= "ami-007855ac798b5175e"
    instance_type = "t2.micro"
    key_name = "fiapq"
    tags = {
      Name = "dev${count.index}"
    }
  }