variable "projects" {
  type        = map(any)
  description = "Map of project environments inside the org."
  default     = {}
}

variable "static_hosts" {
  description = "To create a Host Catalog, a Host Set and attach a Host provided inside a Project."
  type        = map(any)
  default     = {}

}

variable "targets" {
  description = "To creates a Targets of a given type within a Project"
  type        = map(any)
  default     = {}
}

variable "credential_store_static" {
  description = "To creates a Static Credential Store in the Project"
  type        = map(any)
  default     = {}
}
