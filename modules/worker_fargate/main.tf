locals {
  service_map = {
    boundary = {
      create          = true
      service_scaling = true
      service_container_definitions = jsonencode([
        module.container_boundary.json_map_object,
      ])

      service_task_cpu      = var.service_task_cpu
      service_task_memory   = var.service_task_memory
      service_desired_count = var.service_desired_count
      ecs_load_balancers = [
        {
          target_group_arn = element(module.nlb.target_group_arns, 0),
          container_name   = "container-${var.name}",
          container_port   = var.service_container_port
        }
      ]
      efs_volumes = [
        {
          name = "efs-boundary"
          efs_volume_configuration = [
            {
              file_system_id     = aws_efs_file_system.boundary.id
              transit_encryption = "ENABLED"
              authorization_config = [
                {
                  iam             = "ENABLED"
                  access_point_id = aws_efs_access_point.boundary.id
                }
              ]
            }
          ]
        }
      ]
    }
  }
}

module "ecs_task_execution_role" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source  = "SPHTech-Platform/ecs/aws//modules/iam"
  version = "~> 0.2.0"

  role_name             = "ecs-task-execution-role-${var.name}"
  trusted_role_services = ["ecs-tasks.amazonaws.com"]
  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  ]
  create_instance_profile = false
  policy                  = data.aws_iam_policy_document.execution_custom_policy.json
  policy_name             = "ecs-task-execution-policy-${var.name}"
}

module "ecs_task_role" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source  = "SPHTech-Platform/ecs/aws//modules/iam"
  version = "~> 0.2.0"

  role_name             = "ecs-task-role-${var.name}"
  trusted_role_services = ["ecs-tasks.amazonaws.com"]
  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
  ]
  create_instance_profile = false
  policy                  = data.aws_iam_policy_document.task_custom_policy.json
  policy_name             = "ecs-task-policy-${var.name}"
}

resource "aws_security_group" "ecs_sg" {
  #checkov:skip=CKV2_AWS_5:Security group is attached to another resource
  name        = "ecs-sg-${var.name}"
  description = "Allow inbound traffic for boundary worker"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "Allow inbound traffic from NLB in public subnet"
    from_port   = var.service_container_port
    to_port     = var.service_container_port
    protocol    = "tcp"
    cidr_blocks = [for s in data.aws_subnet.public : s.cidr_block]
  }

  ingress {
    description = "Allow inbound traffic from NLB in public subnet"
    from_port   = var.boundary_worker_ops_port
    to_port     = var.boundary_worker_ops_port
    protocol    = "tcp"
    cidr_blocks = [for s in data.aws_subnet.public : s.cidr_block]
  }

  egress {
    description = "Allow outbound traffic from ECS"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-ec2-no-public-egress-sgr
  }
}

module "boundary_cluster" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source  = "SPHTech-Platform/ecs/aws"
  version = "~> 0.2.0"

  name                            = var.name
  launch_type                     = "FARGATE"
  platform_version                = "LATEST"
  create_launch_template          = false
  service_task_execution_role_arn = module.ecs_task_execution_role.iam_role_arn
  service_task_role_arn           = module.ecs_task_role.iam_role_arn
  service_map                     = local.service_map
  service_subnets                 = [for s in data.aws_subnet.private : s.id]
  service_security_groups         = [aws_security_group.ecs_sg.id]
  enable_execute_command          = true
}
