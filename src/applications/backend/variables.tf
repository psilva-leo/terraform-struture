## Environment Variables ##
variable "environment" {
  description = "Environment name (e.g. develop, qa, prod)" 
}

variable "aws_region" {
  description = "Region name (e.g. sa-east-1, us-east-1)" 
}

variable "private_key_file" {
  description = "Private encryption key file path" 
}



## Project Name Variables ##

variable "main_project_name" {
  description = "Project name without prefix or sufix (e.g. backend, front)"
  default = "backend"
}

variable "sub_project_name" {
  description = "SubProject name. If a project has several deploys with diferent names (e.g. backend-api, front-api) the subproject is api"
  default = ""
}



## Module Variables ##

variable "db_host_vault" {
  description = "Encrypted db host"
  default = "XwY0/TosVPQQXPR0XmJQBPeGFpyqlSq1zLLn6GmVhYmoF/djBsn3F1rx8DNn6mZymBAywHADgrnLUY3xf60h8hmpPf6TQVxfTDbSYBQdzlo97QwS1dmQA5ThtWOy9/7qqRI86+jYS2megE4x+JRqYG9OmfmckYMU7Bz6U+o10mE="
}

variable "asg_min_size" {
  type    = map(map(number))
  default = {
    "develop" = {
      "us-east-1" = 0
      "sa-east-1" = 0
    }
  }
}

variable "asg_max_size" {
  type    = map(map(number))
  default = {
    "develop" = {
      "us-east-1" = 15
      "sa-east-1" = 5
    }
  }
}



locals {
  project_name = "${var.main_project_name}${var.sub_project_name == "" ? "" : "-${var.sub_project_name}"}"
}