# State 3
## Infrastructure
![Infrastructure State 3](../images/state_3.svg)
## A launch configuration
Launche configuration is a templante that is used to lauch new instances with EC2 or Auto scaling group.  
[more info](https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchConfiguration.html)
## An autoscaling group
An Auto scaling is a collection of EC2 instances with a purpose that could scale dynamically.  
[more info](https://docs.aws.amazon.com/autoscaling/ec2/userguide/AutoScalingGroup.html)
## An ELB
An Elastic Load Balancer give and endpoint and divide the requests among a group of resources
[more info](https://aws.amazon.com/es/elasticloadbalancing/?whats-new-cards-elb.sort-by=item.additionalFields.postDateTime&whats-new-cards-elb.sort-order=desc)
## Variables
Variables works as a parameter of terraform configuration.  
[more info](https://www.terraform.io/docs/language/values/variables.html)
## Variables file
This is a file with `.tfvars` extention where you can set the value of the declared variables
[more info](https://www.terraform.io/docs/language/values/variables.html#assigning-values-to-root-module-variables)
## Output values
Output values are like return parameter.  
[more info](https://www.terraform.io/docs/language/values/outputs.html)
## Lists and Maps
A List is a sequence of values and a map is a grup of values identified by a label.  
[more info](https://www.terraform.io/docs/language/expressions/types.html)