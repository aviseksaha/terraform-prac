locals {
  aws_region  = "ap-south-1"
  name_prefix = "learning-terraform"
}

provider "aws" {
  region = local.aws_region
}

# Get latest AMI ID for AWS Linux
data "aws_ami" "aws_linux_latest" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  owners = ["amazon"]
}

# Create EC2 instance using AWS Linux AMI ID
resource "aws_instance" "web01" {
  ami           = data.aws_ami.aws_linux_latest.id
  instance_type = "t3.micro"
  tags = {
    Name = "${local.name_prefix}-web01"
  }
}

# Importing existing resource
resource "aws_instance" "web02" {
   ami = "ami-0f918f7e67a3323f0"
   instance_type = "t2.micro"
   tags = {
    Name = "learning-terraform-02"
   }

}

