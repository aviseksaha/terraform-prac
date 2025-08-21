provider "aws" {
  region = "ap-south-1"
}

module "my_instance" {
  source      = "./ec2-module"
  # ami_id      = "ami-0d682f26195e9ec0f"
  # instance_type = "t2.micro"
  

}

output "instance_public_ip" {
  description = "Public IP of aws instance"
  value = module.my_instance.Instance_publicIP
}