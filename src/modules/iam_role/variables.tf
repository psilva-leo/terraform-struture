variable "environment" {
 description = "Environment name (e.g. develop, qa, prod)" 
}

variable "name" {
  description = "The name of the policy."
}

variable "description" {
  description = "The description of the policy."
  default     = ""
}

variable "policies" {
  type        = list(string)
  description = "The ARN of the policies you want to apply."
}

variable "role_use_case" {
  description = "Choose role Use Case (e.g. lambda, ec2)"
}

variable "role_use_case_map" {
  description = "Role service map by use case."
  type    = map(string)
  default = {
    "lambda" = "lambda.amazonaws.com"
    "ec2"    = "ec2.amazonaws.com"
    "ecs"    = "ecs.amazonaws.com"
  }
}

locals {
  name        = "${module.defaults.role_name_prefix}${var.name}${module.defaults.naming_sufix}"
  description = "${var.description != "" ? var.description : local.name}"
}
