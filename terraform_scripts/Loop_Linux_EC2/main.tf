provider "aws" {
  region = "ap-south-1"
}

variable "instances" {
  type = map(string)
  default = {
    "instanceA" = "t2.micro"
    "instanceB" = "t2.medium"
  }
}

resource "aws_instance" "example_instance" {
  for_each               = var.instances
  ami                    = "ami-0d682f26195e9ec0f"
  instance_type          = each.value
  key_name               = "saikey"
  vpc_security_group_ids = [aws_security_group.example_sg.id]

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = each.key
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
  value       = [for instance in aws_instance.example_instance: instance.private_ip]
  description = "Private IP of AWS"
}

output "instance_public_ip" {
  value       = [for instance in aws_instance.example_instance: instance.public_ip]
  description = "Public IP of AWS"
}