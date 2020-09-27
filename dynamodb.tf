resource "aws_dynamodb_table" "dynamodb-table" {
  name           = local.global_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "Id"

  attribute {
    name = "Id"
    type = "S"
  }

  tags = {
    Name        = local.tags
  }
}