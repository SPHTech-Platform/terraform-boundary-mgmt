module "boundary_cluster" {
  source                  = "../modules/worker_fargate"
  name                    = "boundary-worker"
  env                     = "dev"
  service_task_cpu        = 2048
  service_task_memory     = 8192
  service_desired_count   = 1
  service_container_port  = 9202
  hcp_boundary_cluster_id = "xxxx"

  activation_token = "xxxx" #checkov:skip=CKV_SECRET_6:Base64 High Entropy String
}
