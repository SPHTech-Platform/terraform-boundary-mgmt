#checkov:skip=CKV2_AWS_5:Already attached.
resource "aws_security_group" "boundary_sg" {
  #checkov:skip=CKV2_AWS_5:Already attached.
  name        = "boundary_worker_sg"
  description = "SG for Boundary Worker connection from the client from Internet"
  vpc_id      = data.aws_subnet.pub_subnet.vpc_id

  ingress {
    description = "Boundary Worker Proxy"
    from_port   = 9202
    to_port     = 9202
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-ec2-no-public-ingress-sgr
  }
  egress {
    description = "Open to World as Client needs to connect over internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-ec2-no-public-egress-sgr
  }
  tags = {
    "Name" = var.instance_name
    "Env"  = var.env
  }
}
