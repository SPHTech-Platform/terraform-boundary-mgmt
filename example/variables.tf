variable "aws_env" {
  type        = string
  description = "Env"
  default     = "dev"
}
variable "activation_token" {
  description = "activation token, is a one time activation token created via controller"
  type        = string
}
variable "hcp_boundary_cluster_id" {
  description = "HCP ID"
  type        = string
  default     = ""
}
