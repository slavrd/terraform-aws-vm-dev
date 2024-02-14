# Terraform Module AWS VM DEV

Simple AWS VMs for testing. Can create multiple VMs using single security group where all traffic between the VMs is allowed.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional_ebs_blocks | A map where the values are objects with the same attributes as a aws_ebs_volume with the addition of a device_name attribute that is used for attaching it to the instance. | ```map(object({ device_name = string size = optional(number, null) type = optional(string, null) iops = optional(number, null) throughput = optional(number, null) encrypted = optional(bool, null) kms_key_id = optional(bool, null) final_snapshot = optional(bool, null) multi_attach_enabled = optional(bool, null) snapshot_id = optional(string, null) }))``` | `{}` | no |
| ingress_cidrs | A list of CIDRs to allow incoming traffic from. | `list(string)` | n/a | yes |
| name_prefix | A prefix to insert in the created resources' names. | `string` | `""` | no |
| policy_arns | A list of policy arns to attach to an instance role. | `list(string)` | `[]` | no |
| root_volume_size | The size of the root volume | `number` | `20` | no |
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
| aws_ebs_volume.this | resource |
| aws_iam_instance_profile.this | resource |
| aws_iam_role.this | resource |
| aws_iam_role_policy_attachment.this | resource |
| aws_instance.aws_vm_dev | resource |
| aws_security_group.aws_vm_dev | resource |
| aws_security_group_rule.allow_all_egress | resource |
| aws_security_group_rule.allow_ingress | resource |
| aws_security_group_rule.allow_ingress_sg | resource |
| aws_volume_attachment.this | resource |
| aws_iam_policy_document.instance_assume_role_policy | data source |
| aws_subnet.this | data source |

## Documentation

Generated with [terraform-docs](https://terraform-docs.io/user-guide/introduction/) .

To generate them execute

```bash
terraform-docs markdown table -c .terraform-docs.yml . > README.md
```
