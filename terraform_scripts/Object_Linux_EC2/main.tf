provider "aws" {
  region = "ap-south-1"
}

variable "instance_config" {
  type = object({
    ami = string
    instance_type = list(string)
    key_name = string
  })
  default = {
    ami = "ami-0d682f26195e9ec0f"
    instance_type = [ "t2.micro", "t2.medium", "t2.large" ]
    key_name = "saikey"
  }
}

# variable "instance_tag" {
#   type = map(string)
#   default = {
#     Name = "Linux_instance"
#     Environment = "DevOps"
#     Team = "DevOps"
#   }
# }

# variable "aws_instance" {
#   type = list(string)
#   default = [ "t2.micro", "t2.medium", "t2.large" ]
# }

resource "aws_instance" "example_instance" {
  ami                    = var.instance_config.ami
  instance_type          = var.instance_config.instance_type[0]
  key_name               = var.instance_config.key_name
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