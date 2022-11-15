# Terraform Cloud Template

- [Terraform Cloud Requests](https://github.com/SPHTech-Platform/terraform-cloud-configuration)

## Setting up go-task for Taskfile

`sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d`

## Installing files required for pre-commit hooks

`task`

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_worker"></a> [ec2\_worker](#module\_ec2\_worker) | ./modules/worker_ec2 | n/a |
| <a name="module_management"></a> [management](#module\_management) | ./modules/management | n/a |
| <a name="module_structure"></a> [structure](#module\_structure) | ./modules/structure | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activation_token"></a> [activation\_token](#input\_activation\_token) | activation token, is a one time activation token created via controller | `string` | n/a | yes |
| <a name="input_aws_env"></a> [aws\_env](#input\_aws\_env) | Env | `string` | `"dev"` | no |
| <a name="input_credential_lib"></a> [credential\_lib](#input\_credential\_lib) | To creates a Credential Lib in the Project | `map(any)` | `{}` | no |
| <a name="input_credential_store_vault"></a> [credential\_store\_vault](#input\_credential\_store\_vault) | credential\_store\_vault project and vault namespace. A seperate authetication needs to be provided for vault. | `map(any)` | `{}` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Provide the list of the group, it should be a subset of m\_groups | `list(string)` | `[]` | no |
| <a name="input_hcp_boundary_cluster_id"></a> [hcp\_boundary\_cluster\_id](#input\_hcp\_boundary\_cluster\_id) | HCP ID | `string` | `""` | no |
| <a name="input_m_groups"></a> [m\_groups](#input\_m\_groups) | mapping variable | `map(any)` | `{}` | no |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Org Name | `string` | n/a | yes |
| <a name="input_project_names"></a> [project\_names](#input\_project\_names) | list of project environments inside the org. | `list(string)` | n/a | yes |
| <a name="input_projects"></a> [projects](#input\_projects) | Map of project environments inside the org. | `map(any)` | `{}` | no |
| <a name="input_pub_enable"></a> [pub\_enable](#input\_pub\_enable) | To enable pub IP | `string` | `true` | no |
| <a name="input_static_hosts"></a> [static\_hosts](#input\_static\_hosts) | To create a Host Catalog, a Host Set and attach a Host provided inside a Project. | `map(any)` | `{}` | no |
| <a name="input_targets"></a> [targets](#input\_targets) | To creates a Targets of a given type within a Project | `map(any)` | `{}` | no |
| <a name="input_worker_tag"></a> [worker\_tag](#input\_worker\_tag) | worker\_tag - this needs to match the respective target worker tag filter. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_worker"></a> [ec2\_worker](#module\_ec2\_worker) | ./modules/worker_ec2 | n/a |
| <a name="module_management"></a> [management](#module\_management) | ./modules/management | n/a |
| <a name="module_structure"></a> [structure](#module\_structure) | ./modules/structure | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activation_token"></a> [activation\_token](#input\_activation\_token) | activation token, is a one time activation token created via controller | `string` | n/a | yes |
| <a name="input_aws_env"></a> [aws\_env](#input\_aws\_env) | Env | `string` | `"dev"` | no |
| <a name="input_credential_lib"></a> [credential\_lib](#input\_credential\_lib) | To creates a Credential Lib in the Project | `map(any)` | `{}` | no |
| <a name="input_credential_store_vault"></a> [credential\_store\_vault](#input\_credential\_store\_vault) | credential\_store\_vault project and vault namespace. A seperate authetication needs to be provided for vault. | `map(any)` | `{}` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Provide the list of the group, it should be a subset of m\_groups | `list(string)` | `[]` | no |
| <a name="input_hcp_boundary_cluster_id"></a> [hcp\_boundary\_cluster\_id](#input\_hcp\_boundary\_cluster\_id) | HCP ID | `string` | `""` | no |
| <a name="input_m_groups"></a> [m\_groups](#input\_m\_groups) | mapping variable | `map(any)` | `{}` | no |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Org Name | `string` | n/a | yes |
| <a name="input_project_names"></a> [project\_names](#input\_project\_names) | list of project environments inside the org. | `list(string)` | n/a | yes |
| <a name="input_projects"></a> [projects](#input\_projects) | Map of project environments inside the org. | `map(any)` | `{}` | no |
| <a name="input_pub_enable"></a> [pub\_enable](#input\_pub\_enable) | To enable pub IP | `string` | `true` | no |
| <a name="input_static_hosts"></a> [static\_hosts](#input\_static\_hosts) | To create a Host Catalog, a Host Set and attach a Host provided inside a Project. | `map(any)` | `{}` | no |
| <a name="input_targets"></a> [targets](#input\_targets) | To creates a Targets of a given type within a Project | `map(any)` | `{}` | no |
| <a name="input_worker_tag"></a> [worker\_tag](#input\_worker\_tag) | worker\_tag - this needs to match the respective target worker tag filter. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
