provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example_ec2" {
  ami                    = "ami-0d03cb826412c6b0f"
  instance_type          = "t2.micro"
  key_name               = "MyTest"
  vpc_security_group_ids = [aws_security_group.example_sg.id]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "MyInstance"
  }
}

resource "aws_security_group" "example_sg" {
  name        = "example_sg"
  description = "http and tcp allowed"

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
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = { Name = "MyInstance_sg" }

}

output "instance_public_ip" {
  value       = aws_instance.example_ec2.public_ip
  description = "public ip of my instance is : "
}

output "instance_private_ip" {
  value       = aws_instance.example_ec2.private_ip
  description = "private ip of my instance is : "
}

output "instance_public_dns" {
#   value = aws_instance.example_ec2.public_dns
  value = "ssh -i ${aws_instance.example_ec2.key_name}.pem ec2-user@${aws_instance.example_ec2.public_dns}"
}