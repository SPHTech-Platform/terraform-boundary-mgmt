variable "pub_enable" {
  type        = string
  description = "To enable pub IP"
  default     = true
}

variable "ami" {
  type        = string
  description = "AMI ID"
  default     = "ami-094bbd9e922dc515d"
}

variable "instance_type" {
  type        = string
  description = "Instance Type"
  default     = "t2.medium"
}

variable "instance_name" {
  type        = string
  description = "instance name"
  default     = "boundary-worker"
}

variable "env" {
  type        = string
  description = "Env"
  default     = "dev"
}

variable "hcp_boundary_cluster_id" {
  description = "HCP ID"
  type        = string
  default     = "256bed8b-62b8-4e09-a4df-23a79921dc40"
}

variable "activation_token" {
  description = "activation token"
  type        = string
}
variable "worker_tag" {
  description = "worker_tag"
  type        = string
}
