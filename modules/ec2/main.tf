data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_instance" "server" {
  ami                    = data.aws_ami.al2023.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [var.ec2_sg_id]

  user_data                   = templatefile("${path.module}/templates/user_data.sh.tpl", {
    app_repo_url          = var.app_repo_url
    app_repo_ref          = var.app_repo_ref
    db_host               = var.db_host
    db_password           = var.db_password
    jwt_secret            = var.jwt_secret
    blog_mongodb_uri      = var.blog_mongodb_uri
    tour_mongodb_uri      = var.tour_mongodb_uri
    payment_mongodb_uri   = var.payment_mongodb_uri
    neo4j_uri             = var.neo4j_uri
    neo4j_user            = var.neo4j_user
    neo4j_password        = var.neo4j_password
    grafana_cloud_api_key = var.grafana_cloud_api_key
    ec2_public_ip         = var.ec2_public_ip
  })
  user_data_replace_on_change = true

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = "tourism-server"
  }

  lifecycle {
    ignore_changes = [ami]
  }
}

resource "aws_eip_association" "server" {
  instance_id   = aws_instance.server.id
  allocation_id = var.eip_allocation_id
}