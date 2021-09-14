# State 2
## Remote backend
Remote backend store terraform state, this confing is usefull for teams.  
[more info](https://www.terraform.io/docs/language/settings/backends/remote.html)
## Data source
Data source allow to terraform use impormation that was define in another terraform or in the provider console.  
[more info](https://www.terraform.io/docs/language/data-sources/index.html)
## Variables
Variables works as a parameter of terraform configuration.  
[more info](https://www.terraform.io/docs/language/values/variables.html)
## Variables file
This is a file with `.tfvars` extention where you can set the value of the declared variables
[more info](https://www.terraform.io/docs/language/values/variables.html#assigning-values-to-root-module-variables)
## Output values
Output values are like return parameter.  
[more info](https://www.terraform.io/docs/language/values/outputs.html)
## Local Values
Local values could be defined, it could be used in other sections of the code to avoid repeating.  
[more info](https://www.terraform.io/docs/language/values/locals.html)
## Count
Count is a meta argument and terraform will to create that number of resource instances.  
[more info](https://www.terraform.io/docs/language/meta-arguments/count.html)