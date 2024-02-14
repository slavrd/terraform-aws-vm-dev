# common vars

variable "name_prefix" {
  type        = string
  description = "A prefix to insert in the created resources' names."
  default     = ""
}

# network variables

variable "vpc_id" {
  type        = string
  description = "The Id of the AWS VPC in which to create the resources."
}

variable "subnet_id" {
  type        = string
  description = "The Id of the AWS subnet in which to create the VM."
}

variable "ingress_cidrs" {
  type        = list(string)
  description = "A list of CIDRs to allow incoming traffic from."
}

# VM settings

variable "vm_count" {
  type        = number
  description = "The number of VMs to create."
  default     = 1
}

variable "vm_image_id" {
  type        = string
  description = "The Id of the AWS AMI to use for the VM."
}

variable "vm_type" {
  type        = string
  description = "The type of the VM."
  default     = "t3.medium"
}

variable "vm_key_name" {
  type        = string
  description = "The name of the AWS key pair to use for the VM."
}

variable "vm_user_data_base64" {
  type        = string
  description = "The user data to pass to the VM."
  default     = null
}

variable "root_volume_size" {
  type        = number
  description = "The size of the root volume"
  default     = 20
}

variable "additional_ebs_blocks" {
  type = map(object({
    device_name          = string
    size                 = optional(number, null)
    type                 = optional(string, null)
    iops                 = optional(number, null)
    throughput           = optional(number, null)
    encrypted            = optional(bool, null)
    kms_key_id           = optional(bool, null)
    final_snapshot       = optional(bool, null)
    multi_attach_enabled = optional(bool, null)
    snapshot_id          = optional(string, null)
  }))
  description = "A map where the values are objects with the same attributes as a aws_ebs_volume with the addition of a device_name attribute that is used for attaching it to the instance."
  default     = {}
  validation {
    condition     = !anytrue([for k in keys(var.additional_ebs_blocks) : strcontains(k, "+")])
    error_message = "The map kyes must not contain '+' character."
  }
}

variable "policy_arns" {
  type        = map(string)
  description = "A map where the keys are arbitrary identifiers and the values are policy arns to attach to an instance role."
  default = {}
}