variable "environment" {
 description = "Environment name (e.g. develop, qa, prod)" 
}

variable "name" {
  description = "The name of the bucket."
}
variable "instance_type" {
  description = "The Instance Type of the instance to launch."
}

variable "max_size" {
  description = "The maximum size of the auto scale group. "
}

variable "min_size" {
  description = " The minimum size of the auto scale group."
}


locals {
  name = "${module.defaults.asg_name_prefix}${var.name}-${var.environment}"
}
