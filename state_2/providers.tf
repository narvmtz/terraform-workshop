terraform {
  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.58.0"
    }
  }
}

provider "aws" {
  region  = "${var.region}"  # variables can be injected from files, too
  profile = "${var.profile}"
}