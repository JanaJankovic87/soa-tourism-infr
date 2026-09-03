resource "aws_db_instance" "stakeholders" {
  identifier        = "stakeholders-db"
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  storage_type      = "gp2"
  storage_encrypted = true

  db_name  = "stakeholders"
  username = "postgres"
  password = var.db_password

  publicly_accessible    = false
  vpc_security_group_ids = [var.rds_sg_id]

  skip_final_snapshot = true

  tags = {
    Name = "stakeholders-db"
  }

  lifecycle {
    ignore_changes = [db_name]
  }
}