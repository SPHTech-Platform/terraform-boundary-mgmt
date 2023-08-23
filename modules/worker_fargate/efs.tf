resource "aws_security_group" "efs_sg" {
  name        = "efs-sg-${var.name}"
  description = "Allow traffic from ECS Fargate"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description     = "Allow inbound traffice from ECS Fargate"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_sg.id]
  }

  egress {
    description     = "Allow outbound traffic from EFS"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.ecs_sg.id]
  }
}

resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "^.+$"
}

resource "aws_efs_file_system" "boundary" {
  creation_token = random_string.random.result
  #checkov:skip=CKV_AWS_184:Encrypt EFS with default KMS
  encrypted        = true
  performance_mode = "generalPurpose"
}

resource "aws_efs_mount_target" "boundary" {
  count = length([for s in data.aws_subnet.private : s.id])

  file_system_id  = aws_efs_file_system.boundary.id
  subnet_id       = [for s in data.aws_subnet.private : s.id][count.index]
  security_groups = [aws_security_group.efs_sg.id]
}

resource "aws_efs_access_point" "boundary" {
  #checkov:skip=CKV_AWS_329: "EFS access points should enforce a root directory"
  #checkov:skip=CKV_AWS_330: "EFS access points should enforce a user identity"

  file_system_id = aws_efs_file_system.boundary.id
}
