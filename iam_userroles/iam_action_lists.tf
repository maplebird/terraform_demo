variable "readonly_actions" {
  type = "list"

  default = [
    "autoscaling:List*",
    "autoscaling:Describe*",
    "cloudwatch:Describe*",
    "cloudwatch:Get*",
    "cloudwatch:List*",
    "dynamodb:Describe*",
    "dynamodb:Get*",
    "dynamodb:List*",
    "dynamodb:Query*",
    "dynamodb:Scan*",
    "ec2:Describe*",
    "ec2:*Tags",
    "ecr:BatchCheckLayerAvailability",
    "ecr:BatchGetImage",
    "ecr:Describe*",
    "ecr:Get*",
    "ecr:List*",
    "ecs:Describe*",
    "ecs:List*",
    "ecs:Poll",
    "elasticache:Describe*",
    "elasticache:Get*",
    "elasticache:List*",
    "kinesis:Describe*",
    "kinesis:Get*",
    "kinesis:List*",
    "lambda:Get*",
    "lambda:List*",
    "logs:Describe*",
    "logs:Filter*",
    "logs:Get*",
    "logs:List*",
    "rds:Describe*",
    "rds:List*",
    "sns:Describe*",
    "sns:Get*",
    "sns:List*",
    "sqs:Get*",
    "sqs:List*",
  ]
}

variable "limited_actions" {
  type = "list"

  default = [
    "apigateway:*",
    "dynamodb:PutItem",
    "dynamodb:Query*",
    "dynamodb:Scan*",
    "dynamodb:UpdateItem",
    "ec2:AttachVolume",
    "ec2:CreateVolume",
    "ec2:Describe*",
    "ec2:ModifyInstanceAttribute",
    "ec2:StartInstances",
    "ec2:StopInstances",
    "ec2:*Tags",
    "lambda:InvokeFunction",
    "sqs:DeleteMessage*",
    "sqs:Receive*",
    "sqs:Send*",
    "iam:Get*",
    "iam:List*",
  ]
}

# Allow delete volume/terminate instance in dev/staging but not prod
variable "extra_allowed_actions_by_env" {
  type = "map"

  default = {
    dev = [
      "ec2:DeleteVolume",
      "ec2:TerminateInstances",
    ]

    st = [
      "ec2:DeleteVolume",
      "ec2:TerminateInstances",
    ]

    prod = []

    shared = []
  }
}

variable "delete_database_actions" {
  type = "list"

  default = [
    "rds:DeleteDBCluster",
    "rds:DeleteDBClusterEndpoint",
    "rds:DeleteDBClusterSnapshot",
    "rds:DeleteDBInstance",
    "rds:DeleteDBSnapshot",
    "dynamodb:DeleteTable",
    "elasticsearch:DeleteElasticSearchDomain",
    "kinesis:DeleteStream",
  ]
}

# Deny everything by wildcard except iam:Get* and iam:List*
variable "modify_iam_actions" {
  type = "list"

  default = [
    "iam:A*",
    "iam:B*",
    "iam:C*",
    "iam:D*",
    "iam:E*",
    "iam:F*",
    "iam:Generate*",
    "iam:H*",
    "iam:I*",
    "iam:J*",
    "iam:K*",
    "iam:M*",
    "iam:N*",
    "iam:O*",
    "iam:P*",
    "iam:Q*",
    "iam:R*",
    "iam:S*",
    "iam:T*",
    "iam:U*",
    "iam:V*",
    "iam:W*",
    "iam:X*",
    "iam:Y*",
    "iam:Z*",
  ]
}
