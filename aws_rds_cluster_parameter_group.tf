resource "aws_rds_cluster_parameter_group" "this" {
  name_prefix = "${var.env}-"
  family      = var.family
  tags        = merge(map("Name", "${var.env}"), var.tags)
  parameter {
    name         = "lower_case_table_names"
    value        = "1"
    apply_method = "pending-reboot"
  }
  parameter {
    name         = "slow_query_log"
    value        = "1"
    apply_method = "pending-reboot"
  }
  parameter {
    name         = "general_log"
    value        = "1"
    apply_method = "pending-reboot"
  }
  lifecycle {
    create_before_destroy = true
  }
}