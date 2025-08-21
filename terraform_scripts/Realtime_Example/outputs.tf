output "MyAppServicePublic_IP" {
    description = "Public IP of aws instance"
    value = aws_instance.example_instance[0].public_ip
}
output "MyAppServicePrivate_IP" {
    description = "Private IP of aws instance"
    value = aws_instance.example_instance[0].private_ip
}
output "MyAppServicePublic_IP_1" {
    description = "Public IP of aws instance"
    value = aws_instance.example_instance[1].public_ip
}
output "MyAppServicePrivate_IP_1" {
    description = "Private IP of aws instance"
    value = aws_instance.example_instance[1].private_ip
}