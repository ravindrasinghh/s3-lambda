variable "versioning" {
  type    = string
  default = true
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