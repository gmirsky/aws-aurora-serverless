resource "aws_db_subnet_group" "this" {
  name_prefix = "${var.env}-"
  subnet_ids  = var.subnet_ids
  tags        = merge(map("Name", "${var.env}"), var.tags)
  lifecycle {
    create_before_destroy = true
  }
}
