# output "address" {
#   value = "${aws_instance.wb.public_dns}"
# }

output "lambda-consumer_basec_queue" {
  value = aws_lambda_function.consumer_basec_queue.qualified_arn
}

output "sqs-basec-queue" {
  value = aws_sqs_queue.feed-basec.id
}

output "es-challenge-endpoint" {
  value = aws_elasticsearch_domain.es.endpoint
}
