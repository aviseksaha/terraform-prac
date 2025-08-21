provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "example_s3" {
  bucket = "avisek-devops-bucket-12345-${terraform.workspace}"
}
