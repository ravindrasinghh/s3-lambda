resource "aws_s3_bucket" "this" {
  bucket = "v1-dynamodb-test-v2"
  acl    = var.bucket_acl

  versioning {
    enabled = var.versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}
resource "aws_s3_bucket_object" "this" {
  bucket = aws_s3_bucket.this.id
  key    = "employee.csv"
  etag = filemd5("employee.csv")
}