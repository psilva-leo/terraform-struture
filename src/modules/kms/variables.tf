variable "name" {
  description = "The display name of the alias."
}

variable "description" {
  description = "The description of the key as viewed in AWS console."
  default = ""
}

locals {
  description = "${var.description != "" ? var.description : var.name}"
}
