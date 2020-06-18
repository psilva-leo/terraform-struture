module "defaults" {
  source = "/home/usr_terraform/src/modules/defaults"
  environment = var.environment
}

resource "aws_sqs_queue" "sqs" {
  name                       = local.name
  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  delay_seconds             = var.delay_seconds
  receive_wait_time_seconds = var.receive_wait_time_seconds
}
