resource "aws_security_group" "aws_vm_dev" {
  name        = "${var.name_prefix}aws-vm-dev"
  description = "EC2 ${var.name_prefix}aws-vm-dev"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_all_egress" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.aws_vm_dev.id
}

resource "aws_security_group_rule" "allow_ingress" {
  type              = "ingress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = var.ingress_cidrs
  security_group_id = aws_security_group.aws_vm_dev.id
}

resource "aws_instance" "aws_vm_dev" {
  ami                         = var.vm_image_id
  instance_type               = var.vm_type
  key_name                    = var.vm_key_name
  vpc_security_group_ids      = [aws_security_group.aws_vm_dev.id]
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  user_data_base64            = var.vm_user_data_base64

  tags = {
    "Name" = "${var.name_prefix}aws-vm-dev"
  }
}