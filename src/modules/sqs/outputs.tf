output "name" {
  description = "SQS name"
  value = "${aws_sqs_queue.sqs.name}"
}

output "arn" {
  description = "SQS arn"
  value = "${aws_sqs_queue.sqs.arn}"
}
