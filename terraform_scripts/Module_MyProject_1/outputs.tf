# terraform-aws-ec2/outputs.tf

output "instance_public_ip" {
  value = module.my_ec2.public_ip
}