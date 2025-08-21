provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "example_s3" {
    bucket = "avisek-devops-saidemy-007"

    lifecycle {
      prevent_destroy = true
    }

    tags = {
      Name = "MyS3Bucket"
      Production = "Development"
    }
}
