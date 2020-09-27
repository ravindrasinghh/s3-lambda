output "bucket_name" {
    value = aws_s3_bucket.this.id
}
output "lambda_function_name" {
    value = aws_lambda_function.lambda.arn
}
output "aws_api_gateway_deployment" {
  value = aws_api_gateway_deployment.this.invoke_url
}