locals {
  ssm_aft_path   = "/aft/provisioned/vpc"
  ssm_aft_params = toset(data.aws_ssm_parameters_by_path.vpc.names)

  vpc_id          = nonsensitive(data.aws_ssm_parameter.vpc["${local.ssm_aft_path}/vpc_id"].value)
  public_subnets  = split(",", nonsensitive(data.aws_ssm_parameter.vpc["${local.ssm_aft_path}/public_subnets"].value))
  private_subnets = split(",", nonsensitive(data.aws_ssm_parameter.vpc["${local.ssm_aft_path}/private_subnets"].value))
}

data "aws_ssm_parameters_by_path" "vpc" {
  path      = local.ssm_aft_path
  recursive = true
}

data "aws_ssm_parameter" "vpc" {
  for_each = local.ssm_aft_params
  name     = each.key
}

data "aws_vpc" "default" {
  id = local.vpc_id
}

data "aws_subnet" "public" {
  for_each = toset(local.public_subnets)
  id       = each.value
}

data "aws_subnet" "private" {
  for_each = toset(local.private_subnets)
  id       = each.value
}


data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "execution_custom_policy" {
  statement {
    actions   = ["logs:CreateLogGroup"]
    resources = ["arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/ecs/${var.name}/*"]
  }

  #   statement {
  #     actions = [
  #       "ssm:GetParameter",
  #       "ssm:GetParameters",
  #       "ssm:GetParametersByPath"
  #     ]
  #     resources = [
  #       "arn:aws:ssm:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:parameter/sphtech/awedio/*"
  #     ]
  #   }
}


data "aws_iam_policy_document" "task_custom_policy" {
  #checkov:skip=CKV_AWS_111: "Ensure IAM policies does not allow write access without constraints"

  statement {
    sid = "ECSExecSSM"

    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel"
    ]

    resources = ["*"]
  }

  statement {
    sid = "ECSExecKMS"

    actions = ["kms:Decrypt"]

    # To remove circular dependency
    #resources = [module.boundary_cluster.ecs_cluster_kms_arn]
    resources = ["*"]
  }

  statement {
    sid = "ECSExecDescLogGroups"

    actions = ["logs:DescribeLogGroups"]

    resources = ["*"] #tfsec:ignore:aws-iam-no-policy-wildcards
  }

  statement {
    sid = "ECSExecLogStreams"

    actions = [
      "logs:CreateLogStream",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents"
    ]

    resources = ["arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:/aws/ecs/ecs-${var.name}"]
  }

}
