variable "org_name" {
  type        = string
  description = "Org Name"
}

variable "project_names" {
  type        = list(string)
  description = "(optional) list of project environments inside the org."
}

variable "group_name" {
  type        = list(string)
  description = "Provide the list of the group, it should be a subset of m_groups"
  default     = []
}

variable "m_groups" {
  type        = map(any)
  description = "mapping variable"
  default     = {}
}

variable "global_id" {
  type        = string
  description = "mapping variable"
  default     = ""
}
