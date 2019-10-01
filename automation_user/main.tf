provider "aws" {
  region = "${var.aws_region}"
}

# Get accound id
data "aws_caller_identity" "current" {}

terraform {
  backend "s3" {
    bucket = "maplebird-tfstate"
    key    = "provisioning_user/terraform.tfstate"
    region = "us-east-1"
    acl    = "bucket-owner-full-control"
  }
}

data "terraform_remote_state" "apn" {
  backend = "s3"

  config {
    bucket = "maplebird-tfstate"
    key    = "provisioning_user/terraform.tfstate"
    region = "us-east-1"
    acl    = "bucket-owner-full-control"
  }
}
