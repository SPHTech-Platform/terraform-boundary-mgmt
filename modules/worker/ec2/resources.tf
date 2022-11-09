module "ec2_boundary_worker" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "4.2.0"
  ami                         = var.ami
  associate_public_ip_address = var.pub_enable
  instance_type               = var.instance_type
  name                        = var.instance_name
  subnet_id                   = data.aws_subnet.pub_subnet.id
  tags = {
    "Name" = var.instance_name
    "Env"  = var.env
  }
  volume_tags = {
    "Name" = var.instance_name
    "Env"  = var.env
  }

  vpc_security_group_ids = [aws_security_group.boundary_sg.id]


  user_data                   = data.cloudinit_config.this.rendered
  user_data_replace_on_change = true

}
