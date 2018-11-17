##
# AWS Simple Queue Service (SQS)
##

resource "aws_sqs_queue" "request-to-basea" {
  name                      = "request-to-basea-queue"
  message_retention_seconds = 86400
}

resource "aws_sqs_queue" "feed-basec" {
  name                      = "feed-basec-queue"
  message_retention_seconds = 86400
}
