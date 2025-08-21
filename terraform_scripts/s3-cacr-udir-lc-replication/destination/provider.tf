provider "aws" {
  alias   = "destination"
#   alias   = "profile destination-profile"
  profile = "destination-profile"
  region  = "us-east-1"
  default_tags {
    tags = {
      terraform   = "true"
      application = "replication"
      environment = "dev"
    }
  }
}
