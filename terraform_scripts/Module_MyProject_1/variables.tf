# terraform-aws-ec2/variables.tf

variable "instance_name" {
  type    = string
  default = "MyDefaultInstance"
}

variable "ami_id" {
  type    = string
  default = "ami-0d682f26195e9ec0f"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}