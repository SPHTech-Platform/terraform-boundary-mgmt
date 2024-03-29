<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.38.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.38.0 |
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_boundary_worker"></a> [ec2\_boundary\_worker](#module\_ec2\_boundary\_worker) | terraform-aws-modules/ec2-instance/aws | ~> 4.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.boundary_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.pub_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [cloudinit_config.this](https://registry.terraform.io/providers/hashicorp/cloudinit/2.2.0/docs/data-sources/config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activation_token"></a> [activation\_token](#input\_activation\_token) | activation token, is a one time activation token created via controller | `string` | n/a | yes |
| <a name="input_ami"></a> [ami](#input\_ami) | AMI ID | `string` | `"ami-094bbd9e922dc515d"` | no |
| <a name="input_env"></a> [env](#input\_env) | Env | `string` | `"dev"` | no |
| <a name="input_hcp_boundary_cluster_id"></a> [hcp\_boundary\_cluster\_id](#input\_hcp\_boundary\_cluster\_id) | HCP ID | `string` | `""` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | instance name | `string` | `"boundary-worker"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance Type | `string` | `"t2.medium"` | no |
| <a name="input_pub_enable"></a> [pub\_enable](#input\_pub\_enable) | To enable pub IP | `string` | `true` | no |
| <a name="input_worker_tags"></a> [worker\_tags](#input\_worker\_tags) | worker\_tags - this needs to match the respective target worker tag filter. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private of the boundary worker EC2 |
| <a name="output_pub_ip"></a> [pub\_ip](#output\_pub\_ip) | Pub IP of the boundary worker EC2 |
<!-- END_TF_DOCS --><!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.38.0 |
| <a name="requirement_cloudinit"></a> [cloudinit](#requirement\_cloudinit) | ~> 2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.38.0 |
| <a name="provider_cloudinit"></a> [cloudinit](#provider\_cloudinit) | ~> 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_boundary_worker"></a> [ec2\_boundary\_worker](#module\_ec2\_boundary\_worker) | terraform-aws-modules/ec2-instance/aws | ~> 4.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.boundary_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.pub_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [cloudinit_config.this](https://registry.terraform.io/providers/hashicorp/cloudinit/latest/docs/data-sources/config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_activation_token"></a> [activation\_token](#input\_activation\_token) | activation token, is a one time activation token created via controller | `string` | n/a | yes |
| <a name="input_ami"></a> [ami](#input\_ami) | AMI ID | `string` | `"ami-094bbd9e922dc515d"` | no |
| <a name="input_env"></a> [env](#input\_env) | Env | `string` | `"dev"` | no |
| <a name="input_hcp_boundary_cluster_id"></a> [hcp\_boundary\_cluster\_id](#input\_hcp\_boundary\_cluster\_id) | HCP ID | `string` | `""` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | instance name | `string` | `"boundary-worker"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Instance Type | `string` | `"t2.medium"` | no |
| <a name="input_pub_enable"></a> [pub\_enable](#input\_pub\_enable) | To enable pub IP | `string` | `true` | no |
| <a name="input_worker_tags"></a> [worker\_tags](#input\_worker\_tags) | worker\_tags - this needs to match the respective target worker tag filter. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private of the boundary worker EC2 |
| <a name="output_pub_ip"></a> [pub\_ip](#output\_pub\_ip) | Pub IP of the boundary worker EC2 |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
