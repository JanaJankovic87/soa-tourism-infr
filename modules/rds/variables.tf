variable "rds_sg_id" {
  description = "RDS security group"
  type        = string
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}