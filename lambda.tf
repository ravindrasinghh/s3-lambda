data "archive_file" "welcome" {
    type = "zip"
    source_file = "lambda_function.py"
    output_path = "outputs/lambda_function.zip"
}
resource "aws_lambda_function" "lambda" {
  filename      = "outputs/lambda_function.zip"
  function_name = var.function_name
  role          = aws_iam_role.s3_lambda_role.arn
  handler       = "lambda_function.lambda_handler"
  source_code_hash = filebase64sha256("outputs/lambda_function.zip")

  runtime = "python3.7"
}
resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.this.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.lambda.arn
    events              = ["s3:ObjectCreated:*"]
    filter_suffix       = ".csv"
  }

}
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromS3Bucket"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda.arn
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.this.arn
}