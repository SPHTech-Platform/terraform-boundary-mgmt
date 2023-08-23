# ##### MANAGEMENT VARIABLES #####

# variable "projects" {
#   type        = map(any)
#   description = "Map of project environments inside the org."
#   default     = {}
# }

# variable "static_hosts" {
#   description = "To create a Host Catalog, a Host Set and attach a Host provided inside a Project."
#   type        = map(any)
#   default     = {}

# }

# variable "targets" {
#   description = "To creates a Targets of a given type within a Project"
#   type        = map(any)
#   default     = {}
# }

# variable "credential_lib" {
#   description = "To creates a Credential Lib in the Project"
#   type        = map(any)
#   default     = {}
# }

# variable "credential_store_vault" {
#   description = "credential_store_vault project and vault namespace. A seperate authetication needs to be provided for vault."
#   type        = map(any)
#   default     = {}
# }

# ##### STRUCTURE VARIABLES #####

# variable "org_name" {
#   type        = string
#   description = "Org Name"
# }

# variable "project_names" {
#   type        = list(string)
#   description = "list of project environments inside the org."
# }

# variable "group_name" {
#   type        = list(string)
#   description = "Provide the list of the group, it should be a subset of m_groups"
#   default     = []
# }


# variable "m_groups" {
#   type        = map(any)
#   description = "mapping variable"
#   default     = {}
# }

# ##### EC2_WORKER VARIABLES #####


# variable "aws_env" {
#   type        = string
#   description = "Env"
#   default     = "dev"
# }
# variable "activation_token" {
#   description = "activation token, is a one time activation token created via controller"
#   type        = string
#   default     = ""
# }
# variable "hcp_boundary_cluster_id" {
#   description = "HCP ID"
#   type        = string
#   default     = ""
# }

# variable "worker_tags" {
#   description = "worker_tags - this needs to match the respective target worker tag filter."
#   type        = string
# }

# variable "pub_enable" {
#   type        = string
#   description = "To enable pub IP"
#   default     = true
# }
