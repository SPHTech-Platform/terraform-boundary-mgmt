module "example_dev_worker" {
  source = "../modules/worker_ec2"
  # version                 = "~> 0.1.7"
  hcp_boundary_cluster_id = "1234"
  activation_token        = "1234"
  env                     = "dev"
  pub_enable              = true
  worker_tags             = "example"
}
