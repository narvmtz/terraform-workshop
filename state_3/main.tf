locals {
  common_tags = {
    project = "terraform-workshop"
    responsible = var.responsible
  }
}
resource "aws_security_group" "terraform_workshop_app_sg" {
  name        = "terraform-workshop-app-sg"
  description = "Allow HTTP access"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.app_port
    to_port     = var.app_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}

resource "aws_security_group" "terraform_workshop_elb_sg" {
  name        = "terraform-workshop-elb-sg"
  description = "Allow HTTP access"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = "${var.elb_http_port}"
    to_port     = "${var.elb_http_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}

data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-gp2"]
  }

  owners = ["amazon"]
}

resource "" "name" {
  /* Launch configuration */
}

resource "" "name" {
  /* AWS Elastic load balancer */
}

resource "" "name" {
  /* Autoscaling group */

  tags = [
    {
      key                 = "Name"
      value               = "terraform-workshop-asg"
      propagate_at_launch = true
    },
    {
      key = "project"
      value = local.common_tags["project"]
      propagate_at_launch = true
    },
    {
      key = "responsible"
      value = local.common_tags["responsible"]
      propagate_at_launch = true
    }
  ]
}
