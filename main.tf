terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "security" {
  source = "./modules/security"
}

module "ec2" {
  source        = "./modules/ec2"
  ec2_sg_id     = module.security.ec2_sg_id
  key_name      = var.key_name
  instance_type = var.instance_type

  eip_allocation_id     = var.eip_allocation_id
  ec2_public_ip         = var.ec2_public_ip
  app_repo_url          = var.app_repo_url
  app_repo_ref          = var.app_repo_ref
  db_host               = split(":", module.rds.db_endpoint)[0]
  db_password           = var.db_password
  jwt_secret            = var.jwt_secret
  blog_mongodb_uri      = var.blog_mongodb_uri
  tour_mongodb_uri      = var.tour_mongodb_uri
  payment_mongodb_uri   = var.payment_mongodb_uri
  neo4j_uri             = var.neo4j_uri
  neo4j_user            = var.neo4j_user
  neo4j_password        = var.neo4j_password
  grafana_cloud_api_key = var.grafana_cloud_api_key
}

module "rds" {
  source      = "./modules/rds"
  rds_sg_id   = module.security.rds_sg_id
  db_password = var.db_password
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.frontend_bucket_name
}