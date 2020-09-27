# resource "aws_api_gateway_rest_api" "this" {
#   name               = "test"
#   binary_media_types = var.binary_media_types
#   api_key_source     = var.api_key_source
#   endpoint_configuration {
#     types = var.endpoint_configuration
#   }
# }

# resource "aws_api_gateway_method" "this" {
#   rest_api_id   = aws_api_gateway_rest_api.this.id
#   resource_id   = aws_api_gateway_rest_api.this.root_resource_id
#   http_method   = "ANY"
#   authorization = "NONE"
# }

# resource "aws_api_gateway_integration" "this" {
#   rest_api_id             = aws_api_gateway_rest_api.this.id
#   resource_id             = aws_api_gateway_rest_api.this.root_resource_id
#   http_method             = "ANY"
#   integration_http_method = "ANY"
#   type                    = "AWS_PROXY"
#   uri                     = aws_lambda_function.lambda.invoke_arn
# }

# resource "aws_api_gateway_deployment" "this" {
#   depends_on = [
#     aws_api_gateway_integration.this
#   ]

#   rest_api_id = aws_api_gateway_rest_api.this.id
#   stage_name  = "deploy"
# }

# resource "aws_lambda_permission" "this" {
#   statement_id  = "AllowAPIGatewayInvoke"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.lambda.function_name
#   principal     = "apigateway.amazonaws.com"
#   source_arn    = "${aws_api_gateway_rest_api.this.execution_arn}/*/*"
# }