variable "environment" {
 description = "Environment name (e.g. develop, qa, prod)" 
}

variable "name" {
  description = "The name of the bucket."
}

variable "is_log_bucket" {
  description = "Set to true if the S3 bucket is a log bucket."
  default = false
}


locals {
  name = "${module.defaults.s3_name_prefix}${var.name}${module.defaults.naming_sufix}"
}
