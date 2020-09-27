variable "bucket_name" {
  default = "s3-lambda-dynamodb-v1"
}
variable "versioning" {
  type    = string
  default = false
}
variable "bucket_acl" {
  type    = string
  default = "private"
}
variable "block_public_acls" {
  default = true
  type    = bool
}
variable "block_public_policy" {
  default = true
  type    = bool
}
variable "ignore_public_acls" {
  default = true
  type    = bool
}
variable "restrict_public_buckets" {
  default = true
  type    = bool
}
variable "function_name" {
  default = "s3-lmabda-v1"
}