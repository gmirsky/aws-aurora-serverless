resource "aws_security_group" "this" {
  name_prefix = "${var.env}-mysql-"
  vpc_id      = var.vpc_id
  tags        = merge(map("Name", "${var.env}-mysql"), var.tags)
  lifecycle {
    create_before_destroy = true
  }
  ingress {
    description = "Port 3306 from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.ingress_cidr_blocks
  }
}
