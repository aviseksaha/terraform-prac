packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
    vagrant = {
      version = "~> 1"
      source = "github.com/hashicorp/vagrant"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "my-first-packer-image"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  source_ami    = "ami-0f918f7e67a3323f0"
  ssh_username  = "ubuntu"
}
 
build {
  name    = "my-first-build"
  sources = ["source.amazon-ebs.ubuntu"]
 
  provisioner "shell" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx",
      # "sudo ufw allow proto tcp from any to any port 22,80,443",
      # "echo 'y' | sudo ufw enable",
      "sudo systemctl status nginx",
      "sudo nginx -v",
      "sudo nginx -v",
      "sleep 120"
    ]
  }
 
  post-processor "vagrant" {}
  post-processor "compress" {}
}