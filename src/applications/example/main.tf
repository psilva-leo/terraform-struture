
module "ssm" {
  source = "/home/usr_terraform/src/modules/ssm"
  name   = var.project_name
  value  = var.project_name
  environment = var.environment
}

output "ssm" {
  value = module.ssm.arn
}


module "sqs" {
  source      = "/home/usr_terraform/src/modules/sqs"
  name        = var.project_name
  environment = var.environment
}

output "sqs" {
  value = module.sqs.name
}


module "s3" {
  source = "/home/usr_terraform/src/modules/s3"
  name = var.project_name
  # is_log_bucket = false
  environment = var.environment
}

output "s3" {
  value = module.s3.arn
}



module "auto_scaling" {
  source = "/home/usr_terraform/src/modules/auto_scaling"
  name = var.project_name
  environment = var.environment
  max_size = var.asg_max_size[var.environment]["us-east-1"]
  min_size = var.asg_min_size[var.environment]["us-east-1"]
  instance_type = "t3.nano"
}

output "launch_configuration" {
  value = module.auto_scaling.arn
}
