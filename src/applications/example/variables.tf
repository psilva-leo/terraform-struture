variable "environment" {
  description = "Environment name (e.g. develop, qa, prod)" 
}

variable "project_name" {
  description = "Project name without prefix or sufix (e.g. backend, front)"
  default = "example2"
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
