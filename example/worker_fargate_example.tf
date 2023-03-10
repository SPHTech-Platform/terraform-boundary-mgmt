module "boundary_cluster" {
  source = "../modules/worker_fargate"
  # name                    = "boundary-worker"
  env                     = "dev"
  service_task_cpu        = 2048
  service_task_memory     = 8192
  service_desired_count   = 1
  service_container_port  = 9202
  hcp_boundary_cluster_id = "256bed8b-62b8-4e09-a4df-23a79921dc40"

  activation_token = "neslat_2KrQ1iTzt1ex7sGk1pmqPDwHT8dB3hjRQnJ5uaJraupsqK5WqJxU1TaoAQQhKtaspvqQcM9qhok3ppYVMaemoz67MpUpC" #checkov:skip=CKV_SECRET_6:Base64 High Entropy String
}
