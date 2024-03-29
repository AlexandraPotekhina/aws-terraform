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

resource "aws_instance" "app_server" {
  ami           = "ami-0914547665e6a707c"
  instance_type = "t3.micro"

  tags = {
    Name = "ServerInstance"
  }
}