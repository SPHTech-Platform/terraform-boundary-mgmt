variable "pub_enable" {
  default = true
}

variable "ami" {
  default = "ami-094bbd9e922dc515d"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "instance_name" {
  type    = string
  default = "boundary-worker"
}

variable "env" {
  default = "dev"
}

variable "hcp_boundary_cluster_id" {
  type    = string
  default = "256bed8b-62b8-4e09-a4df-23a79921dc40"
}

variable "activation_token" {
  type = string
}
variable "worker_tag" {
  type = string
}
