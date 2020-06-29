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

variable "associate_public_ip_address"{
  description = "Associate a public ip address with an instance in a VPC. This is not enabled by default."
  default = false
}



locals {
  name = "${module.defaults.asg_name_prefix}${var.name}-${var.environment}"
}
