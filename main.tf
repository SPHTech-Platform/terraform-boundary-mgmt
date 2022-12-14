module "structure" {
  source        = "./modules/structure"
  m_groups      = var.m_groups
  org_name      = var.org_name
  group_name    = var.group_name
  project_names = var.project_names
}


module "management" {
  source                 = "./modules/management"
  projects               = var.projects
  static_hosts           = var.static_hosts
  targets                = var.targets
  credential_store_vault = var.credential_store_vault
  credential_lib         = var.credential_lib
}

module "ec2_worker" {
  source                  = "./modules/worker_ec2"
  hcp_boundary_cluster_id = var.hcp_boundary_cluster_id
  activation_token        = var.activation_token
  env                     = var.aws_env
  pub_enable              = var.pub_enable
  worker_tag              = var.worker_tag
}
