module "defaults" {
  source = "/home/usr_terraform/src/modules/defaults"
  environment = var.environment
}

data "aws_kms_alias" "ssm" {
  name = module.defaults.ssm_key_name
}


resource "aws_ssm_parameter" "ssm" {
  name = local.name
  description = local.description
  type = var.type
  key_id = data.aws_kms_alias.ssm.arn
  value = var.value
}
