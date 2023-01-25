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