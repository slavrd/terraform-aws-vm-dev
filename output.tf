output "vm_id" {
  description = "The Id of the VM."
  value       = aws_instance.aws_vm_dev.id
}

output "vm_public_ip" {
  description = "The public IP address of the VM."
  value       = aws_instance.aws_vm_dev.public_ip
}