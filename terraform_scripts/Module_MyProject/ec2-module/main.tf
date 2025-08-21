provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = "saikey"
    vpc_security_group_ids = [aws_security_group.example_sg.id]

    tags = {
      Name = "My_instance"
    }

    root_block_device {
      volume_size = 8
      volume_type = "gp2"
    }
  
}

resource "aws_security_group" "example_sg" {
  name = "security group of aws"
  description = "httpd and ssh must be added"

  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example_sg"
  }

}