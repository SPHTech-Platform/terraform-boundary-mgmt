variable "projects" {
  type        = map(any)
  description = "Map of project environments inside the org."
  default     = {}
}

variable "vault_pub_url" {
  type        = string
  description = "Vault Server public URL"
  default     = ""
}

variable "credential_store_vault" {
  description = "credential_store_vault project and vault namespace. A seperate authetication needs to be provided for vault."
  type        = map(any)
  default     = {}
}

variable "static_hosts" {
  description = "To create a Host Catalog, a Host Set and attach a Host provided inside a Project."
  type        = map(any)
  default     = {}

}

variable "credential_lib_vault" {
  description = "To creates a Vault Credential Lib in the Project"
  type        = map(any)
  default     = {}
}

variable "credential_store_static" {
  description = "To creates a Static Credential Store in the Project"
  type        = map(any)
  default     = {}
}

variable "targets" {
  description = "To creates a Targets of a given type within a Project"
  type        = map(any)
  default     = {}
}
