provider "aws" {
  region  = "ap-southeast-1"
  profile = "default"
}
#saving state file
terraform {
  backend "s3" {
    bucket  = "s3-dynamodb-v1"
    key     = "terraform.tfstate"
    region  = "ap-southeast-1"
    profile = "default"
  }
}