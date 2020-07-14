
module "ssm" {
  source = "/home/usr_terraform/src/modules/ssm"
  name   = local.project_name
  environment = var.environment
  value  = <<EOF
{
  "foo": "bar",
  "db_host": "${rsadecrypt(var.db_host_vault, file(var.private_key_file))}"
}
EOF
}

output "ssm" {
  value = module.ssm.arn
}


module "sqs" {
  source      = "/home/usr_terraform/src/modules/sqs"
  name        = local.project_name
  environment = var.environment
}

output "sqs" {
  value = module.sqs.name
}


# only creates the S3 bucket for the main application. Subprojects should use the same bucket
module "s3" {
  count = var.sub_project_name == "" ? 1 : 0
  source = "/home/usr_terraform/src/modules/s3"
  name = local.project_name
  # is_log_bucket = false
  environment = var.environment
}


module "auto_scaling" {
  source = "/home/usr_terraform/src/modules/auto_scaling"
  name = local.project_name
  environment = var.environment
  max_size = var.asg_max_size[var.environment][var.aws_region]
  min_size = var.asg_min_size[var.environment][var.aws_region]
  instance_type = "t3a.nano"
  associate_public_ip_address = true
}

module "ecs" {
  source = "/home/usr_terraform/src/modules/ecs"
  name = local.project_name
  sub_project_name = var.sub_project_name
  environment = var.environment
  aws_region = var.aws_region
}