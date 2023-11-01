##
# Trigger
#
# Provides a Lambda event source mapping
##

resource "aws_lambda_event_source_mapping" "consumer_basec_queue" {
  batch_size       = 1
  event_source_arn = aws_sqs_queue.feed-basec.arn
  enabled          = true
  function_name    = aws_lambda_function.consumer_basec_queue.arn
}
