# Run once in only one region
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


module "iam_policy" {
  source = "/home/usr_terraform/src/modules/iam_policy"
  name = module.defaults.ec2_role_name
  environment = var.environment
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:DescribeInstances",
        "ec2:DescribeTags",
        "ec2:CreateTags"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [
        "iam:ListAccountAlias",
        "sts:GetCallerIdentity"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}


module "iam" {
  source = "/home/usr_terraform/src/modules/iam_role"
  name = module.defaults.ec2_role_name
  role_use_case = "ec2"
  environment = var.environment
  policies = [module.iam_policy.arn]
}