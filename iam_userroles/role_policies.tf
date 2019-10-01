resource "aws_iam_policy" "admin_role_policy" {
  name   = "tf-admin-role-policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.admin_role_policy_document.json}"
}

resource "aws_iam_policy" "restricted_admin_role_policy" {
  name   = "tf-restricted-admin-role-policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.restricted_admin_role_policy_document.json}"
}

resource "aws_iam_policy" "limited_role_policy" {
  name   = "tf-limited-role-policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.limited_role_policy_document.json}"
}

resource "aws_iam_policy" "readonly_role_policy" {
  name   = "tf-readonly-role-policy"
  path   = "/"
  policy = "${data.aws_iam_policy_document.readonly_role_policy_document.json}"
}
