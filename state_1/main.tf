terraform {
  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.58.0"
    }
  }
}

provider "aws" {
  region  = "us-west-1"
  profile = "tf_workshop"
}

resource "aws_security_group" "aws_terraform_workshop" {
  name        = "aws-terraform-workshop-sg"
  description = "Allow HTTP and SSH access"
  vpc_id      = "vpc-0d2831659ef89870c"

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
    project = "aws-terraform-workshop"
    responsible = "stiven.agudeloo"
  }
}

resource "aws_instance" "aws_terraform_workshop" {
  ami                    = "ami-011996ff98de391d1"                             
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.aws_terraform_workshop.id}"]
  subnet_id              = "subnet-0088df5de3a4fe490"                                   # us-west-1a
  key_name               = "aws-terraform-workshop"
  user_data              = templatefile("userdata.sh", {})

  tags = {
    Name    = "hello-from-be"
    project = "aws-terraform-workshop"
    responsible = "stiven.agudeloo"
  }

  volume_tags = {
    Name    = "hello-from-be"
    project = "aws-terraform-workshop"
    responsible = "stiven.agudeloo"
  }
}
