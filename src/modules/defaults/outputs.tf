## Naming default

output "naming_sufix" {
  value = "${local.naming_sufix}"
}

output "ssm_name_prefix" {
  value = "${var.service_name_prefix}"
}

output "sqs_name_prefix" {
  value = "${var.service_name_prefix}"
}

output "s3_name_prefix" {
  value = "${var.service_name_prefix}"
}

output "launch_configuration_name_prefix" {
  value = "${var.service_name_prefix}"
}
output "asg_name_prefix" {
  value = "${var.service_name_prefix}"
}

## S3 Logging default
output "log_bucket_name" {
  value = "${var.service_name_prefix}logs${local.naming_sufix}"
}

output "ssm_key_name" {
  value = "alias/ssm-key"
}


## Network defaults

output "default_vpc" {
  value = "${data.aws_vpc.default_vpc.id}"
}

output "default_vpc_public_subnets" {
  value = "${data.aws_subnet_ids.default_vpc_public_subnets.ids}"
}

output "default_vpc_private_subnets" {
  value = "${data.aws_subnet_ids.default_vpc_private_subnets.ids}"
}


# AMI default

output "amazon_linux_ecs" {
  value = "${data.aws_ami.amazon_linux_ecs.id}"
}

output "key_name" {
  value = "develop"
}
