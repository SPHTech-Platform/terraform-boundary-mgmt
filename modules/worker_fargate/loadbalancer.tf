module "nlb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 6.0"

  name = "nlb-${var.name}"

  internal           = false
  load_balancer_type = "network"
  vpc_id             = data.aws_vpc.default.id
  subnets            = [for s in data.aws_subnet.public : s.id]

  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = true

  listener_ssl_policy_default = "ELBSecurityPolicy-FS-1-2-Res-2020-10"
  http_tcp_listeners = [
    {
      port               = 9202
      protocol           = "TCP"
      target_group_index = 0
    }
  ]

  target_groups = [
    {
      name                 = "tg-${var.name}"
      backend_protocol     = "TCP"
      backend_port         = var.service_container_port
      target_type          = "ip"
      deregistration_delay = 60
      health_check = {
        enabled             = true
        interval            = 120
        path                = "/health"
        port                = 9203
        healthy_threshold   = 3
        unhealthy_threshold = 3
      }
    }
  ]
}
