disable_mlock = "true"

hcp_boundary_cluster_id = "${hcp_boundary_cluster_id}"

listener "tcp" {
  address = "0.0.0.0:9202"
  purpose = "proxy"
  tls_disable = "false"
}

worker {
  public_addr = "PUBLIC_IP"
  auth_storage_path = "/home/ec2-user/boundary/worker1"
  controller_generated_activation_token = "${activation_token}"
  tags {
    name = ["${worker_tags}"]
  }
}
