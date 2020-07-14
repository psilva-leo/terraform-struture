variable "environment" {
 description = "Environment name (e.g. develop, qa, prod)" 
}

variable "aws_region" {
  description = "AWS region to deploy cluster."
}

variable "name" {
  description = "The name of the ECS cluster, service and task."
}

variable "sub_project_name" {
  description = "The name of the ECS cluster, service and task."
}


locals {
  name = "${module.defaults.launch_configuration_name_prefix}${var.name}${module.defaults.naming_sufix}"
  tag = "${var.environment == "prod" ? "master" : var.environment}"
  project_base_name = "${module.defaults.launch_configuration_name_prefix}${var.sub_project_name != "" ? replace(var.name, "-${var.sub_project_name}", "") : var.name}"
  image = "32424324.dkr.ecr.${var.aws_region}.amazonaws.com/${local.project_base_name}:${local.tag}"
}
