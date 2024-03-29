locals {
  all_disks = { for e in flatten([for i in range(var.vm_count) : [for d in keys(var.additional_ebs_blocks) : "${i}+${d}"]]) : e => var.additional_ebs_blocks[split("+", e)[1]] }
}

resource "aws_ebs_volume" "this" {
  for_each             = local.all_disks
  availability_zone    = data.aws_subnet.this.availability_zone
  size                 = each.value.size
  type                 = each.value.type
  iops                 = each.value.iops
  throughput           = each.value.throughput
  encrypted            = each.value.encrypted
  kms_key_id           = each.value.kms_key_id
  final_snapshot       = each.value.final_snapshot
  multi_attach_enabled = each.value.multi_attach_enabled
  snapshot_id          = each.value.snapshot_id
}

resource "aws_volume_attachment" "this" {
  for_each    = local.all_disks
  device_name = each.value.device_name
  volume_id   = aws_ebs_volume.this[each.key].id
  instance_id = aws_instance.aws_vm_dev[tonumber(split("+", each.key)[0])].id
}

data "aws_subnet" "this" {
  id = var.subnet_id
}