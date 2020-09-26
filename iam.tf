resource "aws_iam_instance_profile" "s3_lambda-iam-profile" {
  name = "dev-iam-profile"
  role = "${aws_iam_role.s3_lambda_role.name}"
}


resource "aws_iam_role" "s3_lambda_role" {
  name = "dev-s3_lambda-role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "s3_lambda_role_policy" {
  role = "${aws_iam_role.s3_lambda_role.id}"
  name = "s3_lambda-role-policy"

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "s3:*",
            "Effect": "Allow",
            "Resource": "*"
        },
                {
            "Action": "cloudwatch:*",
            "Effect": "Allow",
            "Resource": "*"
        },
                {
            "Action": "dynamodb:*",
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
POLICY
}