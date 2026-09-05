variable "aws_region" {
  description = "AWS region name"
  type        = string
  default     = "eu-central-1"
}

variable "key_name" {
  description = "EC2 SSH key"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.small"
}

variable "db_password" {
  description = "RDS master password"
  type        = string
  sensitive   = true
}

variable "frontend_bucket_name" {
  description = "Frontend S3 bucket"
  type        = string
}

variable "eip_allocation_id" {
  description = "Existing Elastic IP"
  type        = string
}

variable "ec2_public_ip" {
  description = "Static public IP"
  type        = string
}

variable "app_repo_url" {
  description = "Application git repository"
  type        = string
  default     = "https://github.com/JanaJankovic87/soa-aws-migration.git"
}

variable "app_repo_ref" {
  description = "Git branch ref"
  type        = string
  default     = "main"
}

variable "jwt_secret" {
  description = "JWT signing secret"
  type        = string
  sensitive   = true
}

variable "blog_mongodb_uri" {
  description = "Blog MongoDB URI"
  type        = string
  sensitive   = true
}

variable "tour_mongodb_uri" {
  description = "Tour MongoDB URI"
  type        = string
  sensitive   = true
}

variable "payment_mongodb_uri" {
  description = "Payment MongoDB URI"
  type        = string
  sensitive   = true
}

variable "neo4j_uri" {
  description = "Neo4j connection URI"
  type        = string
  sensitive   = true
}

variable "neo4j_user" {
  description = "Neo4j username value"
  type        = string
  sensitive   = true
}

variable "neo4j_password" {
  description = "Neo4j account password"
  type        = string
  sensitive   = true
}

variable "grafana_cloud_api_key" {
  description = "Grafana Cloud key"
  type        = string
  sensitive   = true
}