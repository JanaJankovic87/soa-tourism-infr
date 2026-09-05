## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ./modules/ec2 | n/a |
| <a name="module_rds"></a> [rds](#module\_rds) | ./modules/rds | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ./modules/s3 | n/a |
| <a name="module_security"></a> [security](#module\_security) | ./modules/security | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_app_repo_ref"></a> [app\_repo\_ref](#input\_app\_repo\_ref) | Git branch ref | `string` | `"main"` | no |
| <a name="input_app_repo_url"></a> [app\_repo\_url](#input\_app\_repo\_url) | Application git repository | `string` | `"https://github.com/JanaJankovic87/soa-aws-migration.git"` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region name | `string` | `"eu-central-1"` | no |
| <a name="input_blog_mongodb_uri"></a> [blog\_mongodb\_uri](#input\_blog\_mongodb\_uri) | Blog MongoDB URI | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | RDS master password | `string` | n/a | yes |
| <a name="input_ec2_public_ip"></a> [ec2\_public\_ip](#input\_ec2\_public\_ip) | Static public IP | `string` | n/a | yes |
| <a name="input_eip_allocation_id"></a> [eip\_allocation\_id](#input\_eip\_allocation\_id) | Existing Elastic IP | `string` | n/a | yes |
| <a name="input_frontend_bucket_name"></a> [frontend\_bucket\_name](#input\_frontend\_bucket\_name) | Frontend S3 bucket | `string` | n/a | yes |
| <a name="input_grafana_cloud_api_key"></a> [grafana\_cloud\_api\_key](#input\_grafana\_cloud\_api\_key) | Grafana Cloud key | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | `"t3.small"` | no |
| <a name="input_jwt_secret"></a> [jwt\_secret](#input\_jwt\_secret) | JWT signing secret | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | EC2 SSH key | `string` | n/a | yes |
| <a name="input_neo4j_password"></a> [neo4j\_password](#input\_neo4j\_password) | Neo4j account password | `string` | n/a | yes |
| <a name="input_neo4j_uri"></a> [neo4j\_uri](#input\_neo4j\_uri) | Neo4j connection URI | `string` | n/a | yes |
| <a name="input_neo4j_user"></a> [neo4j\_user](#input\_neo4j\_user) | Neo4j username value | `string` | n/a | yes |
| <a name="input_payment_mongodb_uri"></a> [payment\_mongodb\_uri](#input\_payment\_mongodb\_uri) | Payment MongoDB URI | `string` | n/a | yes |
| <a name="input_tour_mongodb_uri"></a> [tour\_mongodb\_uri](#input\_tour\_mongodb\_uri) | Tour MongoDB URI | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | n/a |
| <a name="output_s3_website_endpoint"></a> [s3\_website\_endpoint](#output\_s3\_website\_endpoint) | n/a |
<!-- END_TF_DOCS -->