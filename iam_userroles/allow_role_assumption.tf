# Policy that allows automation user in shared account to assume role in other accounts
data "aws_iam_policy_document" "allow_sts_assume_role_from_shared_policy_document" {
  statement {
    sid = "AllowAssumeRoleFromSharedAccount"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${var.maplebird_account_id}:root",
      ]
    }
  }
}
