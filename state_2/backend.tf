terraform {
  backend "s3" {
    profile = "${var.profile}"
    bucket  = "ramp-up-devops-psl"
    key     = "stiven.agudeloo/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
