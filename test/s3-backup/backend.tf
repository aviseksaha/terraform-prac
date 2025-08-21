terraform {
  backend "s3" {
    bucket = "backup-bucket-123456789xyz"
    key = "default/terraform.tfstate"
    region = "ap-south-1"
  }
}