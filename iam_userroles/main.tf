provider "aws" {
  region  = "${var.aws_region}"
  profile = "terraform"

  assume_role {
    role_arn = "${var.aws_profile_arns[local.apn_env_name]}"
  }
}

# Get accound id
data "aws_caller_identity" "current" {}

terraform {
  backend "s3" {
    bucket = "maplebird-tfstate"
    key    = "iam_userroles/terraform.tfstate"
    region = "us-east-1"
    acl    = "bucket-owner-full-control"
  }
}

data "terraform_remote_state" "apn" {
  backend = "s3"

  config {
    bucket = "maplebird-tfstate"
    key    = "iam_userroles/terraform.tfstate"
    region = "us-east-1"
    acl    = "bucket-owner-full-control"
  }
}

variable "aws_profile_arns" {
  type = "map"

  default {
    maplebird         = "arn:aws:iam::151078733856:role/tf-automation-user-role"
    maplebird_corp    = "arn:aws:iam::632062313401:role/tf-automation-user-role"
  }
}
