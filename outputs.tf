output "sg_id" {
  description = "Security Group ID"
  value       = aws_security_group.this.id
}

output "master_username" {
  description = "Master User Name"
  value       = aws_rds_cluster.this.master_username
}

output "master_password" {
  description = "Master Password"
  value       = random_string.this.result
}

output "endpoint" {
  description = "RDS Cluster Endpoint"
  value       = aws_rds_cluster.this.endpoint
}

output "port" {
  description = "RDS Cluster Port"
  value       = aws_rds_cluster.this.port
}
