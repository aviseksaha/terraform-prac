resource "aws_instance" "example_instance" {
  ami = "ami-0d682f26195e9ec0f"
  instance_type = "t2.micro"
  key_name = "saikey"
  vpc_security_group_ids = [ aws_security_group.example_sg.id ]
  
  count = 2 # Number of instances

  root_block_device {
    volume_size = 8
    volume_type = "gp2"
  }

#   tags = {
#     Name = "MyAppService"
#   }
    tags = {
      Name = element(["MyAppServiceDev", "MyAppServiceStage"], count.index)
    }
}