variable "environment" {
 description = "Environment name (e.g. develop, qa, prod)" 
}

variable "name" {
  description = "The name of the bucket."
}
variable "instance_type" {
  description = "The Instance Type of the instance to launch."
}

variable "enable_monitoring"{
  description = "Enables/disables detailed monitoring. This is not enabled by default."
  default = false
}

variable "ebs_optimized"{
  description = "If true, the launched EC2 instance will be EBS-optimized. This is not enabled by default."
  default = false
}

variable "associate_public_ip_address"{
  description = "Associate a public ip address with an instance in a VPC. This is not enabled by default."
  default = false
}


locals {
  name = "${module.defaults.launch_configuration_name_prefix}${var.name}${module.defaults.naming_sufix}"
}
