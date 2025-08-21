provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "backup-bucket-123456789xyz"
}