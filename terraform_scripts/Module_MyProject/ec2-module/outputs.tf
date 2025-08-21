output "Instance_publicIP" {
  description = "PublicIP of aws instance"
  value = aws_instance.example_instance.public_ip
}

output "Instance_privateIP" {
  description = "PrivateIP of aws instance"
  value = aws_instance.example_instance.private_ip
}