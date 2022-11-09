#checkov:skip=CKV2_AWS_5
resource "aws_security_group" "boundary_sg" {
  name        = "boundary_worker_sg"
  description = "SG for Boundary Worker connection from the client from Internet"
  vpc_id      = data.aws_subnet.pub_subnet.vpc_id

  ingress {
    description = "Boundary Worker Proxy"
    from_port   = 9202
    to_port     = 9202
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Open to World as Client needs to connect over internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "${var.instance_name}"
    "Env"  = "${var.env}"
  }
}
