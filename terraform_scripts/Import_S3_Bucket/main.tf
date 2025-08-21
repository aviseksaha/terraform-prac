provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "example_s3" {
  bucket = "sai-saidemy-terraform-abcd12345"
}