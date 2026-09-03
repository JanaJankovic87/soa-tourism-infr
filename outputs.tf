output "rds_endpoint" {
  value = module.rds.db_endpoint
}

output "s3_website_endpoint" {
  value = module.s3.website_endpoint
}