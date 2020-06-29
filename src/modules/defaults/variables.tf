variable "environment" {
 description = "Environment name (e.g. develop, qa, prod)" 
}

variable "project_name_prefix" {
    description = "project name prefix"
    default = "flowi-"
}

variable "service_name_prefix" {
    description = "Services name prefix"
    default = "flowi-"
}

variable "policy_name_prefix" {
  description = "Policy name prefix"
  default = "policy-"
}

variable "role_name_prefix" {
  description = "Role name prefix"
  default = "role-"
}

locals {
  naming_sufix = "-${var.environment}"
}