variable "environment" {
 description = "Environment name (e.g. develop, qa, prod)" 
}

variable "name" {
  description = "This is the human-readable name of the queue."
}

variable "visibility_timeout_seconds" {
  description = "The visibility timeout for the queue."
  default = "${30 * 60}"
}

variable "message_retention_seconds" {
  description = "The number of seconds Amazon SQS retains a message."
  default = "${14 * 24 * 60 * 60}"
}

variable "receive_wait_time_seconds" {
  description = "The time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning."
  default = 0
}

variable "delay_seconds" {
  description = "The time in seconds that the delivery of all messages in the queue will be delayed."
  default = 0
}


locals {
  name = "${module.defaults.sqs_name_prefix}${var.name}${module.defaults.naming_sufix}"
}
