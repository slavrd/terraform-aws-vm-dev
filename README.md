# Terraform Module AWS VM DEV

Simple AWS VMs for testing. Can create multiple VMs using single security group where all traffic between the VMs is allowed.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| ingress_cidrs | A list of CIDRs to allow incoming traffic from. | `list(string)` | n/a | yes |
| name_prefix | A prefix to insert in the created resources' names. | `string` | `""` | no |
| subnet_id | The Id of the AWS subnet in which to create the VM. | `string` | n/a | yes |
| vm_count | The number of VMs to create. | `number` | `1` | no |
| vm_image_id | The Id of the AWS AMI to use for the VM. | `string` | n/a | yes |
| vm_key_name | The name of the AWS key pair to use for the VM. | `string` | n/a | yes |
| vm_type | The type of the VM. | `string` | `"t3.medium"` | no |
| vm_user_data_base64 | The user data to pass to the VM. | `string` | `null` | no |
| vpc_id | The Id of the AWS VPC in which to create the resources. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vm_id | Mapping of the VMs name and id. |
| vm_private_ip | Mapping of the VMs name and private ip. |
| vm_public_ip | Mapping of the VMs name and public ip. |

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0.0 |
| aws | >= 4.0.0 |

## Resources

| Name | Type |
|------|------|
| aws_instance.aws_vm_dev | resource |
| aws_security_group.aws_vm_dev | resource |
| aws_security_group_rule.allow_all_egress | resource |
| aws_security_group_rule.allow_ingress | resource |
| aws_security_group_rule.allow_ingress_sg | resource |

## Documentation

Generated with [terraform-docs](https://terraform-docs.io/user-guide/introduction/) .

