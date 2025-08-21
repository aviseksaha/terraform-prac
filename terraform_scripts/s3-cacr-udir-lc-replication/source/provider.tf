provider "aws" {
  alias   = "source"
  profile = "source-profile"
  region = "ap-southeast-1"
  default_tags {
    tags = {
      terraform   = "true"
      application = "replication"
      environment = "dev"
    }
  }
}
