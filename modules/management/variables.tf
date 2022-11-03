variable "projects" {
  type        = map(any)
  description = "(optional) Map of project environments inside the org."
  default     = {}
}

variable "vault_pub_url" {
  type        = string
  description = "Vault Server public URL"
  default     = "https://main.vault.0cbdb520-5871-4f8a-b02b-81e27b14da3f.aws.hashicorp.cloud:8200/"
}

variable "credential_store_vault" {
  type    = map(any)
  default = {}
}

variable "static_hosts" {
  type    = map(any)
  default = {}

}

variable "credential_lib" {
  type    = map(any)
  default = {}
}

variable "targets" {
  type    = map(any)
  default = {}
}
