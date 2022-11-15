module "awedio_dev_worker" {
  source                  = "app.terraform.io/sph/mgmt/boundary//modules/worker_ec2"
  version                 = "~> 0.1.7"
  hcp_boundary_cluster_id = var.hcp_boundary_cluster_id
  activation_token        = var.activation_token
  env                     = var.aws_env
  pub_enable              = true
  worker_tag              = "example"
}
