# terraform-aws-ec2/main.tf

provider "aws" {
  region = "ap-south-1"
}

module "my_ec2" {
  source        = "./modules/ec2-instance"
  instance_name = "MyAppServer"
  ami_id        = "ami-0d682f26195e9ec0f"
  instance_type = "t2.micro"
}

# Output the public IP of the EC2 instance
output "ec2_public_ip" {
  value = module.my_ec2.public_ip
}