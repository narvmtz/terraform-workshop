terraform {
  backend "s3" {
    profile = "default"
    bucket  = "wwc-testing-bucket"
    key = "key-nar.tfstate" 
    region  = "us-west-1"
    encrypt = true
  }
}
