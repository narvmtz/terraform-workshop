variable "region" {
  description = "AWS Region"
  type    = string
  default = "us-west-1"
}

variable "profile" {
  description = "AWS profile"
  type    = string
  default = "default"
}

variable "responsible" {
  description = "responsible"
  type    = string
  default = "narvmtz@gmail.com"
}

variable "vpc_id" {
  description = "AWS VPC ID"
  type = string
  default = "vpc-e7c66f81"
}

variable "app_port" {
  description = "port"
  type = string
  default = "5000"
}

variable "instance_type" {
  description = "AMI type"
  type = string
  default = "t2.micro"
}

variable "subnets_list" {
  description = "Available subnets list"
  type = list(string)
  default = [ "subnet-40b0041a", "subnet-cb4bd3ad" ]
}

# variable "key_name" {
#   type = string
# }

variable "elb_http_port" {
  description = "elastic load balancer port"
  type = string
  default = "80"
}

variable "asg_max_size" {
  description = "max size autoscaling group"
  type = string
  default = "2"
}

variable "asg_min_size" {
  description = "min size autoscaling group"
  type = string
  default = "1"
}

variable "asg_desired_capacity" {
  description = "desired capacity autoscaling group"
  type = string
  default = "2"
}
