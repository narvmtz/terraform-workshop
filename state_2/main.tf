locals {
  common_tags = {
    project = "aws-terraform-workshop"
    responsible = "${var.responsible}"
  }
}
resource "aws_security_group" "aws_terraform_workshop" {
  name        = "aws-terraform-workshop-sg"
  description = "Allow HTTP and SSH access"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = "${var.app_port}"
    to_port     = "${var.app_port}"
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
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "tf_workshop" {
  ami                    = "${data.aws_ami.latest_amazon_linux.id}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${aws_security_group.aws_terraform_workshop.id}"]
  subnet_id              = "${var.subnet_id}"
  key_name               = "${var.key_name}"
  user_data              = templatefile("userdata.sh", {})
  count                  = "${var.instances}"

  tags = merge(
    {
      Name = "hello-from-be"
    },
    local.common_tags)

  volume_tags = merge(
    {
      Name = "hello-from-be"
    },
    local.common_tags)
}
