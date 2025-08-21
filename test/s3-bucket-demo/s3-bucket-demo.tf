# Terraform Block
terraform {
  required_version = ">= 1.6" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

# Specify the AWS details
provider "aws" {
 region = "ap-south-1"
}

# Create a s3-bucket
resource "aws_s3_bucket" "s3-demo" {
 bucket = "avisek-s3-bucket-june25"
}