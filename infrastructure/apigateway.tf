##
# API Gateway
##
resource "aws_api_gateway_rest_api" "search_basec_api" {
  name        = "search_basec_api"
  description = "Endpoint for the search_basec function"
}

resource "aws_api_gateway_resource" "search_basec_resource" {
  rest_api_id = aws_api_gateway_rest_api.search_basec_api.id
  parent_id   = aws_api_gateway_rest_api.search_basec_api.root_resource_id
  path_part   = "search"
}

resource "aws_api_gateway_method" "search_basec_api_get" {
  rest_api_id   = aws_api_gateway_rest_api.search_basec_api.id
  resource_id   = aws_api_gateway_resource.search_basec_resource.id
  http_method   = "GET"
  authorization = "NONE" # TODO: Change to JWT (NONE, CUSTOM, AWS_IAM, COGNITO_USER_POOLS)
}

resource "aws_api_gateway_integration" "search_basec_api_get_integration" {
  rest_api_id             = aws_api_gateway_rest_api.search_basec_api.id
  resource_id             = aws_api_gateway_resource.search_basec_resource.id
  http_method             = aws_api_gateway_method.search_basec_api_get.http_method
  integration_http_method = "GET"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/${aws_lambda_function.search_basec.arn}/invocations"
  passthrough_behavior    = "WHEN_NO_TEMPLATES"
  request_templates = {
    "application/json" = <<REQUEST_TEMPLATE
{
  "cpf": "$input.params('cpf')"
}
REQUEST_TEMPLATE
  }
}
