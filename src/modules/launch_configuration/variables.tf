variable "environment" {
 description = "Environment name (e.g. develop, qa, prod)" 
}

variable "name" {
  description = "The name of the bucket."
}
variable "instance_type" {
  description = "The Instance Type of the instance to launch."
}



locals {
  name = "${module.defaults.launch_configuration_name_prefix}${var.name}${module.defaults.naming_sufix}"
}
