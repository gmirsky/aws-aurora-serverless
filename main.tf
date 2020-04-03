resource "aws_rds_cluster" "this" {
  cluster_identifier_prefix       = "${var.env}-"
  final_snapshot_identifier       = "${var.env}-final"
  engine                          = "aurora"
  engine_mode                     = "serverless"
  engine_version                  = var.engine_version
  availability_zones              = var.availability_zones
  master_username                 = var.master_username
  master_password                 = random_string.this.result
  backup_retention_period         = var.backup_retention_period
  vpc_security_group_ids          = [aws_security_group.this.id]
  db_subnet_group_name            = aws_db_subnet_group.this.id
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.this.id
  deletion_protection             = var.deletion_protection
  snapshot_identifier             = var.snapshot_identifier
  copy_tags_to_snapshot           = true
  storage_encrypted               = true
  enable_http_endpoint            = true
  tags                            = merge(map("Name", "${var.env}"), var.tags)
  scaling_configuration {
    auto_pause               = var.auto_pause
    max_capacity             = var.max_capacity
    min_capacity             = var.min_capacity
    seconds_until_auto_pause = var.seconds_until_auto_pause
  }
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [snapshot_identifier]
  }
}
