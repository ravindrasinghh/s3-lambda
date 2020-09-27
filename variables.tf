#### Generic Variables

variable "application" {
  type = string
}
variable "environment" {
  type = string
}
variable "use_case" {
  type = string
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
### Api Gateway Variables

variable "binary_media_types" {
  type    = list
  default = []
}
variable "endpoint_configuration" {
  type    = list
  default = ["REGIONAL"]
}
variable "api_key_source" {
  type    = string
  default = "HEADER"
}