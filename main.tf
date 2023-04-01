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
resource "aws_db_instance" "mydb_hackaton" {
  allocated_storage    = 10
  db_name              = "mydb_hackaton"
  engine               = "mysql"
  engine_version       = "8.0.32"
  instance_class       = "db.t3.micro"
  username             = "user"
  password             = "password"
  skip_final_snapshot  = true
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "hackaton bucket"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}


/* resource "aws_ecs_cluster" "fiap" {
  name = "fiapHackaton"

  setting {
    name  = "fiapHackaton"
    value = "enabled"
  }
} */
