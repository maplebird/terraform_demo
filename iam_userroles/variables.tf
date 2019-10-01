# Define global variables
variable "aws_region" {
  type    = "string"
  default = "us-east-1"
}

# Define local variables
locals {
  apn_env_name = "${terraform.workspace}"
  account_id   = "${data.aws_caller_identity.current.account_id}"

  # Which roles can be assumed from which group
  dev_group_allowed_role_arns = [
    "arn:aws:iam::${var.maplebird_account_id}:role/tf-readonly",
    "arn:aws:iam::${var.maplebird_corp_account_id}:role/tf-readonly",
    "arn:aws:iam::${var.maplebird_corp_account_id}:role/tf-limited",
  ]

  dev_privileged_group_allowed_role_arns = [
    "arn:aws:iam::${var.maplebird_account_id}:role/tf-readonly",
    "arn:aws:iam::${var.maplebird_corp_account_id}:role/tf-readonly",
    "arn:aws:iam::${var.maplebird_corp_account_id}:role/tf-limited",
    "arn:aws:iam::${var.maplebird_corp_account_id}:role/tf-restricted-admin",
  ]

  admin_group_allowed_role_arns = [
    "arn:aws:iam::${var.maplebird_account_id}:role/tf-*",
    "arn:aws:iam::${var.maplebird_corp_account_id}:role/tf-*",
  ]
}

variable "maplebird_account_id" {
  type    = "string"
  default = "178452673432"
}

variable "maplebird_corp_account_id" {
  type    = "string"
  default = "632062313401"
}


# Define deployment type
variable "env_deployment_type" {
  type = "map"

  default = {
    maplebird      = "shared_services"
    maplebird_corp = "application"
  }
}
