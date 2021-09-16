module "hello_from_develop" {
  source               = "../../../modules/hello_from"
  responsible          = "stiven.agudeloo"
  env                  = "prod"
  vpc_id               = "vpc-0d2831659ef89870c"
  app_port             = "5000"
  subnets_list         = ["subnet-0088df5de3a4fe490", "subnet-055c41fce697f9cca"]
  key_name             = "terraform-workshop"
  elb_http_port        = "80"
  asg_max_size         = 3
  asg_min_size         = 2
  asg_desired_capacity = 3
}
