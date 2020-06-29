module "defaults" {
  source = "/home/usr_terraform/src/modules/defaults"
  environment = var.environment
}

resource "aws_iam_policy" "policy" {
  name        = local.name
  description = local.description
  policy = var.policy
}
