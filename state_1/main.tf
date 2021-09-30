terraform {
  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.58.0"
    }
  }

  required_version = "~>1.0.2"
}

provider "aws" {
  region  = "us-west-1"
  profile = "tf_workshop"
}

resource "aws_security_group" "terraform_workshop" {
  name        = "terraform-workshop-sg"
  description = "Allow HTTP and SSH access"
  vpc_id      = "vpc-e7c66f81"

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0             # default for AWS, removed by Terraform
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    project = "terraform-workshop"
    responsible = "stiven.agudeloo"
  }
}

resource "aws_instance" "terraform_workshop" {
  ami                    = "ami-075463702effd3ea1"                             
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.terraform_workshop.id]
  subnet_id              = "subnet-40b0041a"                                   # us-west-1a
  key_name               = "terraform-workshop"
  user_data              = templatefile("userdata.sh", {})

  tags = {
    Name    = "hello-from-be"
    project = "terraform-workshop"
    responsible = "stiven.agudeloo"
  }

  volume_tags = {
    Name    = "hello-from-be"
    project = "terraform-workshop"
    responsible = "stiven.agudeloo"
  }
}
