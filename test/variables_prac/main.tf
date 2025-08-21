provider "aws" {
    region = "ap-south-1"
}

variable "amiid" {
    default = "ami-0c1a7f89451184c8b"
}

variable "instance_type" {
    default = "t2.micro"
}


resource "aws_instance" "example" {
    ami = var.amiid
    instance_type = var.instance_type
}
