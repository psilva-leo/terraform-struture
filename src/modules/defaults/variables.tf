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


locals {
  naming_sufix = "-${var.environment}"
}