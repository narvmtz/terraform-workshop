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
}

resource "aws_security_group" "terraform_workshop" {
  name        = "terraform-workshop-sg"
  description = "Allow HTTP and SSH access"
  vpc_id      = "vpc-e7c66f81"

  /* 
  Regla de ingreso para la aplcicacion que corre en el puerto
   */

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

  /* 
  Tags necesarios para el depliegue
  */
  
}

resource "aws_instance" "terraform_workshop" {
  ami                    = "ami-075463702effd3ea1"                             
  instance_type          = "t2.micro"
  key_name               = "terraform-workshop"
  subnet_id              = "subnet-40b0041a"                                   # us-west-1a
  /*
  Security group
  */

  /* 
  Userdata
  */

  /* 
  Tags necesarios para el depliegue
  */

  /* 
  Tags del volumen necesarios para el depliegue
  */
}
