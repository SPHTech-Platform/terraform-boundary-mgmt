<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_boundary"></a> [boundary](#requirement\_boundary) | ~> 1.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_boundary"></a> [boundary](#provider\_boundary) | 1.1.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [boundary_role.org_admin](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/role) | resource |
| [boundary_role.proj_admin](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/role) | resource |
| [boundary_scope.org](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope) | resource |
| [boundary_scope.projects](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Provide the list of the group, it should be a subset of m\_groups | `list(string)` | `[]` | no |
| <a name="input_m_groups"></a> [m\_groups](#input\_m\_groups) | mapping variable | `map(any)` | `{}` | no |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Org Name | `string` | n/a | yes |
| <a name="input_project_names"></a> [project\_names](#input\_project\_names) | list of project environments inside the org. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_projects"></a> [projects](#output\_projects) | Private URL for boundary main cluster |
<!-- END_TF_DOCS --><!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_boundary"></a> [boundary](#requirement\_boundary) | ~> 1.1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_boundary"></a> [boundary](#provider\_boundary) | 1.1.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [boundary_role.org_admin](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/role) | resource |
| [boundary_role.proj_admin](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/role) | resource |
| [boundary_scope.org](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope) | resource |
| [boundary_scope.projects](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/scope) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Provide the list of the group, it should be a subset of m\_groups | `list(string)` | `[]` | no |
| <a name="input_m_groups"></a> [m\_groups](#input\_m\_groups) | mapping variable | `map(any)` | `{}` | no |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Org Name | `string` | n/a | yes |
| <a name="input_project_names"></a> [project\_names](#input\_project\_names) | list of project environments inside the org. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_projects"></a> [projects](#output\_projects) | Private URL for boundary main cluster |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
