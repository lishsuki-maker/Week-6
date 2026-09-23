resource "aws_security_group" "this" {
  name        = var.sg_name
  description = "Managed by the security_group module"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ingress_port
    to_port     = var.ingress_port
    protocol    = "tcp"
    cidr_blocks = var.allowed_sg == null ? var.allowed_cidr_blocks : []
    security_groups = var.allowed_sg == null ? [] : [var.allowed_sg]
  }

  tags = {
    Name = var.sg_name
  }
}
