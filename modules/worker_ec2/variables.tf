variable "pub_enable" {
  type        = string
  description = "To enable pub IP"
  default     = true
}

variable "ami" {
  type        = string
  description = "AMI ID"
  # Pub AWS AMI in ap-southeast-1
  default = "ami-094bbd9e922dc515d"
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
  default     = ""
}

variable "activation_token" {
  description = "activation token, is a one time activation token created via controller"
  type        = string
}
variable "worker_tag" {
  description = "worker_tag - this needs to match the respective target worker tag filter."
  type        = string
}
