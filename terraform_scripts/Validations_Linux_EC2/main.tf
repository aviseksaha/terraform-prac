provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "example_sg" {
  name        = "example_sg"
  description = "test_security_group"
  
  tags = {
    Name = "example_sg"
  }

}

resource "aws_instance" "example_instance" {
  ami           = "ami-0d682f26195e9ec0f"
  instance_type = "t2.micro"
  key_name      = "saikey"

  lifecycle {
    precondition {
      condition     = aws_security_group.example_sg.id != ""
      error_message = "Security group id must not be blank"
    }
    postcondition {
      condition     = self.public_ip != ""
      error_message = "Public IP not present"
    }
  }
  tags = {
    Name = "MyAppServer"
  }

}