terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# variable "aws_token" {}

provider "aws" {
  region  = "eu-north-1"
  # token = var.aws_token
}

resource "aws_instance" "default" {
  ami           = "ami-0914547665e6a707c"
  instance_type = "t3.micro"

  tags = {
    Name = "ServerInstance"
  }
}

resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "default-vpc"
  }
}

resource "aws_subnet" "default" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "eu-north-1"

  tags = {
    Name = "default-subnet"
  }
}