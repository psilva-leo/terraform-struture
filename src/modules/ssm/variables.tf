variable "environment" {
 description = "Environment name (e.g. develop, qa, prod)" 
}

variable "name" {
  description = "The name of the parameter."
}

variable "description" {
  description = "The description of the parameter."
  default = ""
}

variable "type" {
  description = "The type of the parameter."
  default = "SecureString"
}

variable "value" {
  description = "The value of the parameter. "
}


locals {
  name = "${module.defaults.sqs_name_prefix}${var.name}${module.defaults.naming_sufix}"
  description = "${var.description != "" ? var.description : local.name}"
}
