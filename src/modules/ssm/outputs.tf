output "name" {
  description = "SSM name with prefix"
  value = "${aws_ssm_parameter.ssm.name}"
}

output "arn" {
  description = "SSM arn"
  value = "${aws_ssm_parameter.ssm.arn}"
}
