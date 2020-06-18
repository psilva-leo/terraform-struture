variable "environment" {
  description = "Environment name (e.g. develop, qa, prod)" 
}

variable "project_name" {
  description = "Project name without prefix or sufix (e.g. backend, front)"
  default = "infra"
}
