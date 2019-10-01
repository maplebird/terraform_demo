# Attach policies to assumed roles
resource "aws_iam_role_policy_attachment" "admin_role_policy_attachment" {
  role       = "${aws_iam_role.admin_user_role.name}"
  policy_arn = "${aws_iam_policy.admin_role_policy.arn}"
}

resource "aws_iam_role_policy_attachment" "restricted_admin_role_policy_attachment" {
  role       = "${aws_iam_role.restricted_admin_user_role.name}"
  policy_arn = "${aws_iam_policy.restricted_admin_role_policy.arn}"
}

resource "aws_iam_role_policy_attachment" "limited_role_policy_attachment" {
  role       = "${aws_iam_role.limited_access_user_role.name}"
  policy_arn = "${aws_iam_policy.limited_role_policy.arn}"
}

resource "aws_iam_role_policy_attachment" "readonly_role_policy_attachment" {
  role       = "${aws_iam_role.readonly_user_role.name}"
  policy_arn = "${aws_iam_policy.readonly_role_policy.arn}"
}
