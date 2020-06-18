module "defaults" {
  source = "/home/usr_terraform/src/modules/defaults"
  environment = var.environment
}


module "kms" {
  source = "/home/usr_terraform/src/modules/kms"
  name = module.defaults.ssm_key_name
}


module "s3" {
  source = "/home/usr_terraform/src/modules/s3"
  name = "logs"
  is_log_bucket = true
  environment = var.environment
}

output "s3" {
  value = module.s3.arn
}
