# Admin role
data "aws_iam_policy_document" "admin_role_policy_document" {
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

  statement {
    sid = "DenyDirectoryResetUserPassword"
    effect = "Deny"

    actions = [
      "ds:ResetUserPassword",
    ]

    resources = [
      "*",
    ]
  }
}

# Restricted admin - cannot modify IAM or delete critical data
data "aws_iam_policy_document" "restricted_admin_role_policy_document" {
  statement {
    sid    = "AllowAccess"
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

  statement {
    sid    = "DenyIAM"
    effect = "Deny"

    actions = [
      // This explicit deny allows only the following:
      // iam:Get*
      // iam:List*
      "${var.modify_iam_actions}",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "DenyDeleteDatabase"
    effect = "Deny"

    actions = [
      "${var.delete_database_actions}",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid    = "DenyDeleteS3"
    effect = "Deny"

    actions = [
      "s3:DeleteBucket",
      "s3:DeleteObject",
      "s3:DeleteObjectVersion",
    ]

    resources = [
      // Only care about prod buckets
      "arn:aws:s3:::prod-*",
      "arn:aws:s3:::prod-*/*",
    ]
  }

  statement {
    sid = "DenyDirectoryServicesWrite"
    effect = "Deny"

    actions = [
      "ds:AcceptSharedDirectory",
      "ds:AuthorizeApplication",
      "ds:Add*",
      "ds:CancelSchemaExtension",
      "ds:ConnectDirectory",
      "ds:Create*",
      "ds:Delete*",
      "ds:DeregisterEventTopic",
      "ds:Disable*",
      "ds:Enable*",
      "ds:RegisterEventTopic",
      "ds:RejectSharedDirectory",
      "ds:Remove*",
      "ds:ResetUserPassword",
      "ds:RestoreFromSnapshot",
      "ds:ShareDirectory",
      "ds:StartSchemaExtension",
      "ds:UnauthorizeApplication",
      "ds:UnshareDirectory",
      "ds:UpdateConditionalForwarder",
      "ds:UpdateNumberOfDomainControllers",
      "ds:UpdateRadius",
      "ds:UpdateTrust",
      "ds:VerifyTrust",
    ]

    resources = [
      "*"
    ]

  }
}

# Limited access role - only do things from pre-approved list
data "aws_iam_policy_document" "limited_role_policy_document" {
  statement {
    sid    = "AllowLimitedAccess"
    effect = "Allow"

    actions = [
      "${var.readonly_actions}",
      "${var.limited_actions}",
    ]

    resources = [
      "*",
    ]
  }
}

# Read-only role, cannot modify anything
data "aws_iam_policy_document" "readonly_role_policy_document" {
  statement {
    sid    = "ReadOnlyAccess"
    effect = "Allow"

    actions = [
      "${var.readonly_actions}",
    ]

    resources = [
      "*",
    ]
  }
}
