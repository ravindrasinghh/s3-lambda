output "bucket_name" {
    value = aws_s3_bucket.this.id
}
output "lambda_function_name" {
    value = aws_lambda_function.lambda.arn
}