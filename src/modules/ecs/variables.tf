variable "environment" {
 description = "Environment name (e.g. develop, qa, prod)" 
}

variable "name" {
  description = "The name of the bucket."
}


locals {
  name = "${module.defaults.launch_configuration_name_prefix}${var.name}${module.defaults.naming_sufix}"
}
