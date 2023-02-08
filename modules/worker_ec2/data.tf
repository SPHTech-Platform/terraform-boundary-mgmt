locals {
  cloud_config_config = <<-END
    #cloud-config
    ${jsonencode({
  write_files = [
    {
      path        = "/run/boundary/worker-config.hcl"
      permissions = "0644"
      owner       = "ec2-user:ec2-user"
      content = templatefile("${path.module}/worker-config.tpl", { hcp_boundary_cluster_id = var.hcp_boundary_cluster_id
        activation_token = var.activation_token
        worker_tags      = var.worker_tags
      })
  }]

})}
  END
}


data "cloudinit_config" "this" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    filename     = "worker-config.hcl"
    content      = local.cloud_config_config
  }


  part {
    content_type = "text/x-shellscript"
    filename     = "worker.sh"
    content      = file("${path.module}/worker.sh")
  }
}

data "aws_subnet" "pub_subnet" {
  filter {
    name   = "tag:Name"
    values = ["aft-public-ap-southeast-1a"]
  }
}
