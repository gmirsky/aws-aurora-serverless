variable "region" {
  type        = string
  description = "Region"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID"
  default     = "vpc-aaaaaaa" 
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets for RabbitMQ nodes"
  default = [
    "subnet-xxxxxxxx", 
    "subnet-yyyyyyyy", 
    "subnet-zzzzzzzz"  
  ]
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability Zones"
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]
}

variable "ingress_cidr_blocks" {
  type = list(string)
  default = [
    "192.168.203.128/26", 
    "192.168.202.128/25", 
    "192.168.203.192/26",     
    "192.168.201.128/25",     
    "192.168.200.128/25", 
  ]
}

variable "env" {
  type        = string
  description = "(optional) Unique identifier used to name all resources"
  default     = "test-rds-serverless-mysql"
}

variable "snapshot_identifier" {
  description = "RDS Cluster Snapshot Identifier"
  default     = ""
}

variable "family" {
  description = "RDS Cluster Parameter Group Family"
  default     = "aurora5.6"
}

variable "engine_version" {
  type        = string
  description = "Database Engine Version"
  default     = "5.6.10a" # Aurora Serverless is only available with MySQL version 5.6 
}

variable "master_username" {
  type        = string
  description = "Master User Name"
  default     = "root"
}

variable "backup_retention_period" {
  type        = string
  description = "Back Up Retention Period"
  default     = "5"
}

variable "deletion_protection" {
  description = "Deletion Protection"
  default     = false
}

variable "auto_pause" {
  description = "Auto Pause"
  default     = true
}

variable "max_capacity" {
  description = "Maximum Capacity"
  default     = 16
}

variable "min_capacity" {
  description = "Minimum Capacity"
  default     = 1
}

variable "seconds_until_auto_pause" {
  type        = number
  description = "Seconds until auto pause takes effect with no activity"
  default     = 300
}

variable "tags" {
  type        = map
  description = "Common tags to be applied to all resources"
  default = {
    Environment       = "Development"
    cost-center       = "database-rds-development"
    terraform-managed = true
    Project           = "database-rds"
    Release           = "0.01"
    Revision          = "0.01"
    Technology        = "RDS"
    Role              = "database"
  }
}
