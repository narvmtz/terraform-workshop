locals {
  common_tags = {
    project = "terraform-workshop-nv"
    responsible = "${var.responsible}"
  }
}
resource "aws_security_group" "app-sg-nar" {
  name_prefix = "terraform-workshop-"
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

resource "aws_security_group" "terraform_workshop_sg" {
  name        = "terraform-workshop-sg-nar"
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

data "aws_ami" "latest_amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-gp2"]
  }

  owners = ["amazon"]
}

resource "aws_launch_configuration" "launch_configuration" {
  /* Launch configuration */
  name                    = "terraform_workshop_launch_configuration_sg-nar"
  image_id                = data.aws_ami.latest_amazon_linux.id
  instance_type           = var.instance_type
  user_data               = templatefile("templates/userdata.sh", {})

  lifecycle {
    create_before_destroy = true
  }
}
# resource "aws_elb" "terraform-elb" {
#   name               = "terraform-elb"
#   security_groups    = [aws_security_group.terraform_workshop_sg.id]
#   subnets            = var.subnets_list

#   listener {
#     instance_port     = var.app_port
#     instance_protocol = "http"
#     lb_port           = var.elb_http_port
#     lb_protocol       = "http"
#   }

#   health_check {
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 3
#     target              = "HTTP:${var.app_port}/"
#     interval            = 30
#   }

#   tags = local.common_tags
  
# }
resource "aws_lb" "elb" {
  /* AWS Elastic load balancer */
  name               = "elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.terraform_workshop_sg.id]
  subnets            = var.subnets_list

  enable_deletion_protection = true

  access_logs {
    bucket  = "wwc-testing-bucket/nar_.tfstate"
    enabled = true
  }

  tags = {
    Environment = "prod"
  }
}

resource "aws_autoscaling_group" "sg-nar" {
  /* Autoscaling group */
  name_prefix               = "terraform_workshop_autoscaling_group_"
  max_size                  = var.asg_max_size
  min_size                  = var.asg_min_size
  desired_capacity          = var.asg_desired_capacity
  force_delete              = true
  vpc_zone_identifier       = var.subnets_list
  launch_configuration      = aws_launch_configuration.launch_configuration.name

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
