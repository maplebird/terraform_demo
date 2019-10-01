# Role assigned to automation_user
resource "aws_iam_role" "automation_user_role" {
  name               = "tf-automation-user-role"
  assume_role_policy = "${data.aws_iam_policy_document.automation_user_assume_role_policy_document.json}"
}

# Policy for automation user role
resource "aws_iam_policy" "automation_user_role_policy" {
  name   = "tf-automation-user-role-policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.automation_user_role_policy_document.json}"
}

# Automation user role policy attachment
resource "aws_iam_role_policy_attachment" "automation_user_role_policy_attachment" {
  role       = "${aws_iam_role.automation_user_role.name}"
  policy_arn = "${aws_iam_policy.automation_user_role_policy.arn}"
}

# Policy that allows automation user in shared account to assume role in other accounts
data "aws_iam_policy_document" "automation_user_assume_role_policy_document" {
  statement {
    sid = "AllowAutomationUserAccess"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "${local.allowed_automation_user_arns[local.apn_env_name]}",
      ]
    }
  }

  statement {
    sid = "AllowFastAndEntropy"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${var.maplebird_account_id}:user/vlad",
      ]
    }
  }
}

# Policy assigned to automation_user
# TODO: disable login with this user (allow programmatic access only)
data "aws_iam_policy_document" "automation_user_role_policy_document" {
  statement {
    sid    = "AllowFullAccess"
    effect = "Allow"

    actions = [
      "*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "DenyBilling"
    effect = "Deny"

    actions = [
      "aws-portal:ModifyAccount",
      "aws-portal:ModifyBilling",
      "aws-portal:ModifyPaymentMethods",
    ]

    resources = [
      "*",
    ]
  }
}
