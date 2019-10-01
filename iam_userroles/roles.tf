# Role assigned to admin usergroup for sts:AssumeRole from maplebird account
resource "aws_iam_role" "readonly_user_role" {
  name                 = "tf-readonly"
  assume_role_policy   = "${data.aws_iam_policy_document.allow_sts_assume_role_from_shared_policy_document.json}"
  description          = "Read-only user role that allows access to monitoring and visibility into infrastructure."
  max_session_duration = 14400
}

resource "aws_iam_role" "limited_access_user_role" {
  name                 = "tf-limited"
  assume_role_policy   = "${data.aws_iam_policy_document.allow_sts_assume_role_from_shared_policy_document.json}"
  description          = "Read-only access and some EC2 operations."
  max_session_duration = 14400
}

resource "aws_iam_role" "restricted_admin_user_role" {
  name                 = "tf-restricted-admin"
  assume_role_policy   = "${data.aws_iam_policy_document.allow_sts_assume_role_from_shared_policy_document.json}"
  description          = "Admin group that does not allow changes to IAM or account billing."
  max_session_duration = 14400
}

resource "aws_iam_role" "admin_user_role" {
  name                 = "tf-admin"
  assume_role_policy   = "${data.aws_iam_policy_document.allow_sts_assume_role_from_shared_policy_document.json}"
  description          = "Administrator role for user assumption from Shared account by admin team members."
  max_session_duration = 14400
}
