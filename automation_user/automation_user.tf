resource "aws_iam_user" "automation_user" {
  name = "tf-automation-user"
  path = "/"

  // Sets count to 0 if not a shared account so it doesn't create this user in app environments
  // Terraform doesn't do conditionals lol
  count = "${local.create_automation_user[local.apn_env_name]}"
}

resource "aws_iam_user_policy" "automation_user_policy" {
  name   = "tf-automation-user-policy"
  user   = "${aws_iam_user.automation_user.name}"
  policy = "${data.aws_iam_policy_document.automation_user_policy_document.json}"

  // Sets count to 0 if not a shared account so it doesn't create this user in app environments
  // Terraform doesn't do conditionals lol
  count = "${local.create_automation_user[local.apn_env_name]}"
}

data "aws_iam_policy_document" "automation_user_policy_document" {
  statement {
    sid = "AllowIAMRoleAssumptionForAutomationUser"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "arn:aws:iam::${var.maplebird_account_id}:role/tf-automation-user-role",
      "arn:aws:iam::${var.maplebird_corp_account_id}:role/tf-automation-user-role",
    ]
  }

  statement {
    sid = "AllowGetUserAndPassRole"

    actions = [
      "iam:GetRole",
      "iam:PassRole",
      "iam:GetUser",
    ]

    resources = [
      "arn:aws:iam::${var.maplebird_account_id}:role/tf-automation-user-role",
      "arn:aws:iam::${var.maplebird_corp_account_id}:role/tf-automation-user-role",
    ]
  }

  statement {
    sid = "UseStsToken"

    actions = [
      "sts:DecodeAuthorizationMessage",
      "sts:GetFederationToken",
    ]

    resources = [
      "*",
    ]
  }
}
