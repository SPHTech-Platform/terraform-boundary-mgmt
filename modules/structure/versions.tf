terraform {
  required_version = "~> 1.3.0"
  required_providers {
    boundary = {
      source  = "hashicorp/boundary"
      version = "~> 1.1.2"
    }
  }
}
