variable "ec2_sg_id" {
  description = "ID security grupe za EC2"
  type        = string
}

variable "key_name" {
  description = "Ime EC2 key pair-a"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "eip_allocation_id" {
  description = "Allocation ID postojećeg Elastic IP-a koji treba prikačiti na instancu"
  type        = string
}

variable "ec2_public_ip" {
  description = "Poznata (static) Elastic IP adresa instance, upisuje se u .env aplikacije"
  type        = string
}

variable "app_repo_url" {
  description = "Git URL aplikacije koja se klonira i pokreće preko docker-compose.aws.yml"
  type        = string
}

variable "app_repo_ref" {
  description = "Git commit/tag/grana na koji se repo fiksira pri deployment-u (radi reproducibilnosti build-a)"
  type        = string
}

variable "db_host" {
  description = "Hostname RDS instance (bez porta)"
  type        = string
}

variable "db_password" {
  description = "RDS master lozinka"
  type        = string
  sensitive   = true
}

variable "jwt_secret" {
  description = "JWT secret za api-gateway/stakeholders-service"
  type        = string
  sensitive   = true
}

variable "blog_mongodb_uri" {
  description = "MongoDB URI za blog-service"
  type        = string
  sensitive   = true
}

variable "tour_mongodb_uri" {
  description = "MongoDB URI za tour-service"
  type        = string
  sensitive   = true
}

variable "payment_mongodb_uri" {
  description = "MongoDB URI za payment-service"
  type        = string
  sensitive   = true
}

variable "neo4j_uri" {
  description = "Neo4j URI za follower-service"
  type        = string
  sensitive   = true
}

variable "neo4j_user" {
  description = "Neo4j korisničko ime za follower-service"
  type        = string
  sensitive   = true
}

variable "neo4j_password" {
  description = "Neo4j lozinka za follower-service"
  type        = string
  sensitive   = true
}

variable "grafana_cloud_api_key" {
  description = "Grafana Cloud API ključ za promtail"
  type        = string
  sensitive   = true
}