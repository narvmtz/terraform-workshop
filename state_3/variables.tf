variable "region" {
  type    = string
  default = "us-west-1"
}

variable "profile" {
  type    = string
  default = "default"
}

variable "responsible" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "app_port" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnets_list" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "elb_http_port" {
  type = string
}

variable "asg_max_size" {
  type = string
}

variable "asg_min_size" {
  type = string
}

variable "asg_desired_capacity" {
  type = string
}
