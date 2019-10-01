# Define global variables
variable "aws_region" {
  type    = "string"
  default = "us-east-1"
}

# Define local variables
locals {
  apn_env_name = "${terraform.workspace}"
  account_id   = "${data.aws_caller_identity.current.account_id}"
}

variable "maplebird_account_id" {
  type    = "string"
  default = "151078733856"
}

variable "maplebird_corp_account_id" {
  type    = "string"
  default = "632062313401"
}

locals {
  create_automation_user = {
    maplebird      = 1
    maplebird_corp = 0
  }

  allowed_automation_user_arns = {
    maplebird = [
      "arn:aws:iam::${var.maplebird_account_id}:user/tf-automation-user",
    ]

    maplebird_corp = [
      "arn:aws:iam::${var.maplebird_account_id}:user/tf-automation-user",
    ]
  }
}
