output "name" {
  value = var.is_log_bucket ? aws_s3_bucket.s3_log[0].id : aws_s3_bucket.s3[0].id
}

output "arn" {
  value = var.is_log_bucket ? aws_s3_bucket.s3_log[0].arn : aws_s3_bucket.s3[0].arn
}
