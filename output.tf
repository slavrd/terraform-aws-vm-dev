output "vm_id" {
  description = "Mapping of the VMs name and id."
  value       = { for i in aws_instance.aws_vm_dev : i.tags["Name"] => i.id }
}

output "vm_public_ip" {
  description = "Mapping of the VMs name and public ip."
  value       = { for i in aws_instance.aws_vm_dev : i.tags["Name"] => i.public_ip }
}

output "vm_private_ip" {
  description = "Mapping of the VMs name and private ip."
  value       = { for i in aws_instance.aws_vm_dev : i.tags["Name"] => i.private_ip }
}