# Common policies attached to all users

resource "aws_iam_policy" "allow_terraform_tfstate_bucket_policy" {
  count  = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  name   = "tf-allow-tfstate-bucket-policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.terraform_tfstate_bucket_policy_document.json}"
}

resource "aws_iam_policy" "allow_manage_credentials_policy" {
  count  = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  name   = "tf-allow-manage-credentials-policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.allow_manage_credentials_user_policy_document.json}"
}

# Dev users

resource "aws_iam_policy" "dev_group_role_assumption_policy" {
  count  = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  name   = "tf-dev-group-role-assumption-policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.dev_user_role_assumption_policy_document.json}"
}

resource "aws_iam_policy" "dev_privileged_group_role_assumption_policy" {
  count  = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  name   = "tf-dev-privileged-group-role-assumption-policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.dev_privileged_user_role_assumption_policy_document.json}"
}

# Admin users

resource "aws_iam_policy" "admin_group_role_assumption_policy" {
  count  = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  name   = "tf-admin-group-role-assumption-policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.admin_user_role_assumption_policy_document.json}"
}
