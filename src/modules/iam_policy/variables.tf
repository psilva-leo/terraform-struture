variable "environment" {
 description = "Environment name (e.g. develop, qa, prod)" 
}

variable "name" {
  description = "The name of the policy."
}

variable "description" {
  description = "The description of the policy."
  default = ""
}

variable "policy" {
  description = "The policy document. This is a JSON formatted string."
}


locals {
  name = "${module.defaults.policy_name_prefix}${var.name}${module.defaults.naming_sufix}"
  description = "${var.description != "" ? var.description : local.name}"
}
