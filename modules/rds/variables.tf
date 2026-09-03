variable "rds_sg_id" {
  description = "ID security grupe za RDS"
  type        = string
}

variable "db_password" {
  description = "RDS master lozinka"
  type        = string
  sensitive   = true
}