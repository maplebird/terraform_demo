# Attach policies to Dev user group
resource "aws_iam_group_policy_attachment" "dev_group_manage_creds_policy_attachment" {
  count      = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  group      = "${aws_iam_group.dev_account_user_group.name}"
  policy_arn = "${aws_iam_policy.allow_manage_credentials_policy.arn}"
}

resource "aws_iam_group_policy_attachment" "dev_group_tfstate_bucket_policy_attachment" {
  count      = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  group      = "${aws_iam_group.dev_account_user_group.name}"
  policy_arn = "${aws_iam_policy.allow_terraform_tfstate_bucket_policy.arn}"
}

resource "aws_iam_group_policy_attachment" "dev_group_allow_role_assumption" {
  count      = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  group      = "${aws_iam_group.dev_account_user_group.name}"
  policy_arn = "${aws_iam_policy.dev_group_role_assumption_policy.arn}"
}

# Attach policies to Dev privileged user group
resource "aws_iam_group_policy_attachment" "dev_privileged_group_manage_creds_policy_attachment" {
  count      = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  group      = "${aws_iam_group.dev_account_privileged_user_group.name}"
  policy_arn = "${aws_iam_policy.allow_manage_credentials_policy.arn}"
}

resource "aws_iam_group_policy_attachment" "dev_privileged_group_tfstate_bucket_policy_attachment" {
  count      = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  group      = "${aws_iam_group.dev_account_privileged_user_group.name}"
  policy_arn = "${aws_iam_policy.allow_terraform_tfstate_bucket_policy.arn}"
}

resource "aws_iam_group_policy_attachment" "dev_privileged_group_allow_role_assumption" {
  count      = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  group      = "${aws_iam_group.dev_account_privileged_user_group.name}"
  policy_arn = "${aws_iam_policy.dev_privileged_group_role_assumption_policy.arn}"
}

# Attach policies to Admin user group
resource "aws_iam_group_policy_attachment" "admin_group_manage_creds_policy_attachment" {
  count      = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  group      = "${aws_iam_group.admin_account_user_group.name}"
  policy_arn = "${aws_iam_policy.allow_manage_credentials_policy.arn}"
}

resource "aws_iam_group_policy_attachment" "admin_group_tfstate_bucket_policy_attachment" {
  count      = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  group      = "${aws_iam_group.admin_account_user_group.name}"
  policy_arn = "${aws_iam_policy.allow_terraform_tfstate_bucket_policy.arn}"
}

resource "aws_iam_group_policy_attachment" "admin_group_allow_role_assumption" {
  count      = "${local.apn_env_name == "maplebird" ? 1 : 0 }"
  group      = "${aws_iam_group.admin_account_user_group.name}"
  policy_arn = "${aws_iam_policy.admin_group_role_assumption_policy.arn}"
}
