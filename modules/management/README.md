<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_boundary"></a> [boundary](#requirement\_boundary) | ~> 1.1.2 |
| <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) | ~> 0.47.0 |
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
| [boundary_role.org_admin](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/role) | resource |
| [boundary_role.proj_admin](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/role) | resource |
| [boundary_scope.org](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope) | resource |
| [boundary_scope.projects](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope) | resource |
| [boundary_target.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/target) | resource |
| [vault_policy.admin_read](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.boundary_controller](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_token.boundary](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/token) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_credential_lib"></a> [credential\_lib](#input\_credential\_lib) | n/a | `map(any)` | n/a | yes |
| <a name="input_credential_store_vault"></a> [credential\_store\_vault](#input\_credential\_store\_vault) | n/a | `map(any)` | n/a | yes |
| <a name="input_global_id"></a> [global\_id](#input\_global\_id) | mapping variable | `string` | n/a | yes |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Provide the list of the group, it should be a subset of m\_groups | `list(string)` | `[]` | no |
| <a name="input_m_groups"></a> [m\_groups](#input\_m\_groups) | mapping variable | `map(any)` | n/a | yes |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Org Name | `string` | n/a | yes |
| <a name="input_project_names"></a> [project\_names](#input\_project\_names) | (optional) list of project environments inside the org. | `list(string)` | `[]` | no |
| <a name="input_static_hosts"></a> [static\_hosts](#input\_static\_hosts) | n/a | `map(any)` | n/a | yes |
| <a name="input_targets"></a> [targets](#input\_targets) | n/a | `map(any)` | n/a | yes |
| <a name="input_vault_pub_url"></a> [vault\_pub\_url](#input\_vault\_pub\_url) | Vault Server public URL | `string` | `"https://main.vault.0cbdb520-5871-4f8a-b02b-81e27b14da3f.aws.hashicorp.cloud:8200/"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS --><!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_boundary"></a> [boundary](#requirement\_boundary) | ~> 1.1.2 |
| <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) | ~> 0.47.0 |
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
| [boundary_role.org_admin](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/role) | resource |
| [boundary_role.proj_admin](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/role) | resource |
| [boundary_scope.org](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope) | resource |
| [boundary_scope.projects](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope) | resource |
| [boundary_target.this](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/target) | resource |
| [vault_policy.admin_read](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.boundary_controller](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_token.boundary](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/token) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_credential_lib"></a> [credential\_lib](#input\_credential\_lib) | n/a | `map(any)` | n/a | yes |
| <a name="input_credential_store_vault"></a> [credential\_store\_vault](#input\_credential\_store\_vault) | n/a | `map(any)` | n/a | yes |
| <a name="input_global_id"></a> [global\_id](#input\_global\_id) | mapping variable | `string` | n/a | yes |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Provide the list of the group, it should be a subset of m\_groups | `list(string)` | `[]` | no |
| <a name="input_m_groups"></a> [m\_groups](#input\_m\_groups) | mapping variable | `map(any)` | n/a | yes |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Org Name | `string` | n/a | yes |
| <a name="input_project_names"></a> [project\_names](#input\_project\_names) | (optional) list of project environments inside the org. | `list(string)` | `[]` | no |
| <a name="input_static_hosts"></a> [static\_hosts](#input\_static\_hosts) | n/a | `map(any)` | n/a | yes |
| <a name="input_targets"></a> [targets](#input\_targets) | n/a | `map(any)` | n/a | yes |
| <a name="input_vault_pub_url"></a> [vault\_pub\_url](#input\_vault\_pub\_url) | Vault Server public URL | `string` | `"https://main.vault.0cbdb520-5871-4f8a-b02b-81e27b14da3f.aws.hashicorp.cloud:8200/"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
