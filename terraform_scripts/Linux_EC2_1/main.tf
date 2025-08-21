provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example_instance" {
  count                  = 2
  ami                    = "ami-0d682f26195e9ec0f"
  instance_type          = "t2.micro"
  key_name               = "saikey"
  vpc_security_group_ids = [aws_security_group.example_sg.id]

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = element(["Linux_instance1", "Linux_instance2"], count.index)
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

output "instance1_private_ip" {
  value       = [aws_instance.example_instance[0].private_ip]
  description = "aws first instance private ip is :"
}

output "instance1_public_ip" {
  value       = [aws_instance.example_instance[0].public_ip]
  description = "aws first instance public ip is :"
}