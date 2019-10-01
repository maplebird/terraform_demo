# Policy documents that should only be assigned to their corresponding instance profiles
data "aws_iam_policy_document" "allow_manage_credentials_user_policy_document" {
  statement {
    sid = "AllowAllUsersToListAccounts"

    actions = [
      "iam:ListAccountAliases",
      "iam:ListUsers",
      "iam:ListVirtualMFADevices",
      "iam:GetAccountPasswordPolicy",
      "iam:GetAccountSummary",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid = "AllowIndividualUserToSeeAndManageOnlyTheirOwnAccountInformation"

    actions = [
      "iam:ChangePassword",
      "iam:CreateAccessKey",
      "iam:CreateLoginProfile",
      "iam:DeleteAccessKey",
      "iam:DeleteLoginProfile",
      "iam:GetLoginProfile",
      "iam:ListAccessKeys",
      "iam:UpdateAccessKey",
      "iam:UpdateLoginProfile",
      "iam:ListSigningCertificates",
      "iam:DeleteSigningCertificate",
      "iam:UpdateSigningCertificate",
      "iam:UploadSigningCertificate",
      "iam:ListSSHPublicKeys",
      "iam:GetSSHPublicKey",
      "iam:DeleteSSHPublicKey",
      "iam:UpdateSSHPublicKey",
      "iam:UploadSSHPublicKey",
      "iam:GetUser",
    ]

    resources = [
      "arn:aws:iam::*:user/$${aws:username}",
    ]
  }

  statement {
    sid = "AllowIndividualUserToListOnlyTheirOwnMFA"

    actions = [
      "iam:ListMFADevices",
    ]

    resources = [
      "arn:aws:iam::*:mfa/*",
      "arn:aws:iam::*:user/$${aws:username}",
    ]
  }

  statement {
    sid = "AllowIndividualUserToManageTheirOwnMFA"

    actions = [
      "iam:CreateVirtualMFADevice",
      "iam:DeleteVirtualMFADevice",
      "iam:EnableMFADevice",
      "iam:ResyncMFADevice",
    ]

    resources = [
      "arn:aws:iam::*:mfa/$${aws:username}",
      "arn:aws:iam::*:user/$${aws:username}",
    ]
  }

  statement {
    sid = "AllowIndividualUserToDeactivateOnlyTheirOwnMFAOnlyWhenUsingMFA"

    actions = [
      "iam:DeactivateMFADevice",
    ]

    resources = [
      "arn:aws:iam::*:mfa/$${aws:username}",
      "arn:aws:iam::*:user/$${aws:username}",
    ]

    condition {
      test     = "Bool"
      variable = "aws:MultiFactorAuthPresent"

      values = [
        "true",
      ]
    }
  }
}

data "aws_iam_policy_document" "dev_user_role_assumption_policy_document" {
  statement {
    sid = "AllowDevRoleAssumption"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "${local.dev_group_allowed_role_arns}",
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
      "${local.dev_group_allowed_role_arns}",
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

data "aws_iam_policy_document" "dev_privileged_user_role_assumption_policy_document" {
  statement {
    sid = "AllowDevRoleAssumption"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "${local.dev_privileged_group_allowed_role_arns}",
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
      "${local.dev_privileged_group_allowed_role_arns}",
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

data "aws_iam_policy_document" "admin_user_role_assumption_policy_document" {
  statement {
    sid = "AllowDevRoleAssumption"

    actions = [
      "sts:AssumeRole",
    ]

    resources = [
      "${local.admin_group_allowed_role_arns}",
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
      "${local.admin_group_allowed_role_arns}",
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

data "aws_iam_policy_document" "terraform_tfstate_bucket_policy_document" {
  statement {
    sid = "AllowWriteToDevPaths"

    actions = [
      "s3:PutObject",
      "s3:DeleteObject",
    ]

    resources = [
      "arn:aws:s3:::maplebird-tfstate/env:/dev/*",
      "arn:aws:s3:::maplebird-tfstate/user_data/*",
    ]
  }

  statement {
    sid = "AllowAllReadOnly"

    actions = [
      "s3:List*",
      "s3:GetObject*",
    ]

    resources = [
      "arn:aws:s3:::maplebird-tfstate",
      "arn:aws:s3:::maplebird-tfstate/*",
    ]
  }
}
