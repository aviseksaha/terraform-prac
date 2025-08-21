provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example_instance" {
  ami                    = "ami-0d682f26195e9ec0f"
  instance_type          = "t2.micro"
  key_name               = "saikey"
  vpc_security_group_ids = [aws_security_group.example_sg.id]

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "Linux_instance"
  }
}

resource "aws_security_group" "example_sg" {
  name        = "example_security_group"
  description = "http and ssh should be included"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
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

output "instance_private_ip" {
  value       = [aws_instance.example_instance.private_ip]
  description = "aws private ip is :"
}

output "instance_public_ip" {
  value       = [aws_instance.example_instance.public_ip]
  description = "aws public ip is :"
}