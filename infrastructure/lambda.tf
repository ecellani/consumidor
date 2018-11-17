##
# AWS Lambda
#
# Run code without provisioning or managing servers
##

data "archive_file" "consumer_basec_zip" {
  type        = "zip"
  source_dir  = "${var.python_source_path}/feed_basec"
  output_path = "${var.output_lambda_path}/feed_basec.zip"
}

resource "aws_lambda_function" "consumer_basec_queue" {
  function_name    = "consumer_basec_queue"
  filename         = "${data.archive_file.consumer_basec_zip.output_path}"
  source_code_hash = "${data.archive_file.consumer_basec_zip.output_base64sha256}"
  role             = "${aws_iam_role.iam_role.arn}"
  handler          = "consumer_basec_queue.handler"
  runtime          = "python2.7"
  timeout          = 10
  memory_size      = 128

  # vpc_config {
  #   subnet_ids         = ["${aws_subnet.public-subnet-a.id}", "${aws_subnet.private-subnet-b.id}"] # ["${aws_subnet.public-subnet-a.id}", "${aws_subnet.public-subnet-b.id}"]
  #   security_group_ids = ["${aws_security_group.sgweb.id}", "${aws_security_group.sgdb.id}"]
  # }
}

data "archive_file" "search_basec_zip" {
  type        = "zip"
  source_dir  = "${var.python_source_path}/search_events"
  output_path = "${var.output_lambda_path}/search_events.zip"
}

resource "aws_lambda_function" "search_basec" {
  function_name    = "search_basec"
  filename         = "${data.archive_file.search_basec_zip.output_path}"
  source_code_hash = "${data.archive_file.search_basec_zip.output_base64sha256}"
  role             = "${aws_iam_role.iam_role.arn}"
  handler          = "lambda_search.handler"
  runtime          = "python2.7"
  timeout          = 10
  memory_size      = 128

  environment {
    variables = {
      environment = "dev"
    }
  }

  # vpc_config {
  #   subnet_ids         = ["${aws_subnet.public-subnet-a.id}", "${aws_subnet.public-subnet-b.id}"]
  #   security_group_ids = ["${aws_security_group.sgweb.id}"]
  # }
}

resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.search_basec.arn}"
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.aws_region}:${data.aws_caller_identity.current.account_id}:${aws_api_gateway_rest_api.search_basec_api.id}/*/${aws_api_gateway_method.search_basec_api_get.http_method}/search"
}
