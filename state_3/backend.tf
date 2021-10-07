terraform {
  backend "s3" {
    profile = "default"
    bucket  = "wwc-testing-bucket"
    key     = "nar_.tfstate"
    region  = "us-west-1"
    encrypt = true
  }
}
