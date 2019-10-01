# Role assigned to admin usergroup for sts:AssumeRole from maplebird account
resource "aws_iam_group" "dev_account_user_group" {
  count = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  name  = "tf-dev-users"
}

resource "aws_iam_group" "dev_account_privileged_user_group" {
  count = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  name  = "tf-dev-privileged"
}

resource "aws_iam_group" "admin_account_user_group" {
  count = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  name  = "tf-admin-users"
}
