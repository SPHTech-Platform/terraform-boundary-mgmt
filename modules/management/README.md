<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_boundary"></a> [boundary](#requirement\_boundary) | ~> 1.1.2 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 3.9.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_boundary"></a> [boundary](#provider\_boundary) | 1.1.2 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.9.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [boundary_credential_library_vault.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/credential_library_vault) | resource |
| [boundary_credential_store_vault.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/credential_store_vault) | resource |
| [boundary_host_catalog_static.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/host_catalog_static) | resource |
| [boundary_host_set_static.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/host_set_static) | resource |
| [boundary_host_static.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/host_static) | resource |
| [boundary_target.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/target) | resource |
| [vault_policy.admin_read](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.boundary_controller](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_token.boundary](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/token) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_credential_lib"></a> [credential\_lib](#input\_credential\_lib) | To creates a Credential Lib in the Project | `map(any)` | `{}` | no |
| <a name="input_credential_store_vault"></a> [credential\_store\_vault](#input\_credential\_store\_vault) | credential\_store\_vault project and vault namespace. A seperate authetication needs to be provided for vault. | `map(any)` | `{}` | no |
| <a name="input_projects"></a> [projects](#input\_projects) | Map of project environments inside the org. | `map(any)` | `{}` | no |
| <a name="input_static_hosts"></a> [static\_hosts](#input\_static\_hosts) | To create a Host Catalog, a Host Set and attach a Host provided inside a Project. | `map(any)` | `{}` | no |
| <a name="input_targets"></a> [targets](#input\_targets) | To creates a Targets of a given type within a Project | `map(any)` | `{}` | no |
| <a name="input_vault_pub_url"></a> [vault\_pub\_url](#input\_vault\_pub\_url) | Vault Server public URL | `string` | `""` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS --><!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_boundary"></a> [boundary](#requirement\_boundary) | ~> 1.1.2 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 3.9.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_boundary"></a> [boundary](#provider\_boundary) | ~> 1.1.2 |
| <a name="provider_vault"></a> [vault](#provider\_vault) | ~> 3.9.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [boundary_credential_library_vault.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/credential_library_vault) | resource |
| [boundary_credential_store_vault.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/credential_store_vault) | resource |
| [boundary_host_catalog_static.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/host_catalog_static) | resource |
| [boundary_host_set_static.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/host_set_static) | resource |
| [boundary_host_static.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/host_static) | resource |
| [boundary_target.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/target) | resource |
| [vault_policy.admin_read](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.boundary_controller](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_token.boundary](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/token) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_credential_lib"></a> [credential\_lib](#input\_credential\_lib) | To creates a Credential Lib in the Project | `map(any)` | `{}` | no |
| <a name="input_credential_store_vault"></a> [credential\_store\_vault](#input\_credential\_store\_vault) | credential\_store\_vault project and vault namespace. A seperate authetication needs to be provided for vault. | `map(any)` | `{}` | no |
| <a name="input_projects"></a> [projects](#input\_projects) | Map of project environments inside the org. | `map(any)` | `{}` | no |
| <a name="input_static_hosts"></a> [static\_hosts](#input\_static\_hosts) | To create a Host Catalog, a Host Set and attach a Host provided inside a Project. | `map(any)` | `{}` | no |
| <a name="input_targets"></a> [targets](#input\_targets) | To creates a Targets of a given type within a Project | `map(any)` | `{}` | no |
| <a name="input_vault_pub_url"></a> [vault\_pub\_url](#input\_vault\_pub\_url) | Vault Server public URL | `string` | `""` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
