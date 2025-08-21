# Terraform Block
terraform {
  required_version = ">= 1.6" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

# Specify the AWS details
provider "aws" {
 region = "ap-south-1"
}

# Specify the EC2 details
resource "aws_instance" "ec2-demo" {
 ami = "ami-0b09627181c8d5778"
 instance_type = "t2.micro"
}
