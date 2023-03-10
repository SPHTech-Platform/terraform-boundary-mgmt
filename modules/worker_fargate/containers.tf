locals {
  environment_list = [
    {
      name  = "HCP_BOUNDARY_CLUSTER_ID"
      value = var.hcp_boundary_cluster_id
    },
    {
      name  = "WORKER_PUBLIC_ADDR"
      value = module.nlb.lb_dns_name
    },
    {
      name  = "ACTIVATION_TOKEN"
      value = var.activation_token
    },
    {
      name  = "WORKER_TAGS"
      value = "${var.name}-${var.env}"
    }
  ]
}

module "container_boundary" {
  source  = "cloudposse/ecs-container-definition/aws"
  version = "0.58.1"

  container_name  = "container-${var.name}"
  container_image = var.container_image

  log_configuration = {
    logDriver = "awslogs"
    options = {
      "awslogs-group" : "/aws/ecs/${var.name}/container-${var.name}-${var.env}",
      "awslogs-region" : "ap-southeast-1",
      "awslogs-stream-prefix" : "aws",
      "awslogs-create-group" : "true",
    }
    secretOptions = null
  }
  mount_points = [
    {
      containerPath = "/mnt/boundary"
      readOnly      = false
      sourceVolume  = "efs-boundary"
    }
  ]
  port_mappings = [
    {
      "hostPort" : var.service_container_port,
      "protocol" : "tcp",
      "containerPort" : var.service_container_port
    },
    {
      "hostPort" : var.boundary_worker_ops_port,
      "protocol" : "tcp",
      "containerPort" : var.boundary_worker_ops_port
    }
  ]
  healthcheck = {
    command     = ["CMD-SHELL", "curl -f http://localhost:${var.boundary_worker_ops_port}/health || exit 1"]
    interval    = 5
    retries     = 3
    startPeriod = 30
    timeout     = 5
  }
  container_memory_reservation = 128
  environment                  = local.environment_list
}
