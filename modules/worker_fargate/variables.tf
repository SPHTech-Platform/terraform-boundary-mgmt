variable "env" {
  type        = string
  description = "Env"
  default     = "dev"
}

variable "name" {
  description = "Name of the product/project/application"
  type        = string
  default     = "boundary-worker"
}

variable "container_image" {
  description = "Image for the Boundary Worker"
  type        = string
  default     = "public.ecr.aws/sphmedia/sphmedia/boundary-worker:latest"
}

################################################################################
# Boundary
################################################################################
variable "hcp_boundary_cluster_id" {
  description = " The ID of an HCP Boundary cluster. Setting this allows discovery of upstream addresses for self-managed workers to connect to the cluster."
  type        = string
  default     = ""
}

variable "activation_token" {
  description = "A one time activation token created via controller"
  type        = string
  sensitive   = true
}

variable "boundary_worker_ops_port" {
  description = "Port number for boundary worker (purpose=ops) to expose healthchecks"
  type        = number
  default     = 9203
}
################################################################################
# Cluster
################################################################################
variable "service_task_cpu" {
  description = "Number of cpu units used by the task. If the requires_compatibilities is FARGATE this field is required."
  type        = number
  default     = 256
}

variable "service_task_memory" {
  description = "Amount (in MiB) of memory used by the task. If the requires_compatibilities is FARGATE this field is required."
  type        = number
  default     = 512
}

variable "service_desired_count" {
  description = "Number of instances of the task definition to place and keep running."
  type        = number
  default     = 1
}

variable "service_container_port" {
  description = " Port on the container to associate with the load balancer."
  type        = number
  default     = 9202
}
