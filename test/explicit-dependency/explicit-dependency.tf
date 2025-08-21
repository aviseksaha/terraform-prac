# Specify the AWS details
provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "exp-depen" {
  ami           = "ami-0b09627181c8d5778"
  instance_type = "t2.micro"
}
# Create S3 bucket
resource "aws_s3_bucket" "s3-demo" {
  bucket     = "abcd-avisek-2025"
  depends_on = [aws_instance.exp-depen]
}
























provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example_instance" {
  ami                    = "ami-0ec382d10079226f8"
  instance_type          = "t2.micro"
  key_name               = "saikey"
  vpc_security_group_ids = [aws_security_group.example_sg.id]

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }
  

  tags = {
    Name = "WindowsInstance"
  }
}

resource "aws_security_group" "example_sg" {
  name        = "example_security_group"
  description = "Allow SSH and HTTP access"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_public_ip" {
  description = "The public IP Address of EC2 instance"
  value       = aws_instance.example_instance.public_ip
}

output "instance_private_ip" {
  description = "The private IP Address of EC2 instance"
  value       = aws_instance.example_instance.private_ip
}


