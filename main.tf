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

resource "aws_db_instance" "mydb_hackaton" {
  allocated_storage    = 10
  identifier           = "hackathon"
  db_name              = "mydb_hackaton"
  engine               = "mysql"
  engine_version       = "8.0.32"
  instance_class       = "db.t3.micro"
  username             = "user"
  password             = "password"
  auto_minor_version_upgrade = true
  skip_final_snapshot  = true
  tags = {
      Name = "hackathon"
      Environment = "Dev"
  }
}

resource "aws_s3_bucket" "deployment_bucket" {
    bucket = "hf-q-front" 
    tags = {
      Name = "hackathon"
      Environment = "Dev"
    }
}

resource "aws_ecs_cluster" "main" {
  name = "my-cluster"
  tags = {
    "Custo" : "hackaton"
  }
}