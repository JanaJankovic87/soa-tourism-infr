#!/bin/bash
set -euxo pipefail

dnf update -y
dnf install -y docker git
systemctl enable --now docker

if [ ! -f /swapfile ]; then
  fallocate -l 1G /swapfile
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo '/swapfile none swap sw 0 0' >> /etc/fstab
fi

curl -SL https://github.com/docker/compose/releases/download/v5.5.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

mkdir -p /usr/libexec/docker/cli-plugins
curl -SL https://github.com/docker/buildx/releases/download/v0.36.1/buildx-v0.36.1.linux-amd64 -o /usr/libexec/docker/cli-plugins/docker-buildx
chmod +x /usr/libexec/docker/cli-plugins/docker-buildx

rm -rf /opt/app
git clone ${app_repo_url} /opt/app
cd /opt/app
git checkout ${app_repo_ref}

set +x
cat > .env <<ENVEOF
DB_HOST=${db_host}
DB_PASSWORD=${db_password}
EC2_PUBLIC_IP=${ec2_public_ip}
JWT_SECRET=${jwt_secret}
BLOG_MONGODB_URI=${blog_mongodb_uri}
TOUR_MONGODB_URI=${tour_mongodb_uri}
PAYMENT_MONGODB_URI=${payment_mongodb_uri}
NEO4J_URI=${neo4j_uri}
NEO4J_USER=${neo4j_user}
NEO4J_PASSWORD=${neo4j_password}
GRAFANA_CLOUD_API_KEY=${grafana_cloud_api_key}
ENVEOF
chmod 600 .env
set -x

for svc in api-gateway stakeholders-service blog-service tour-service payment-service follower-service; do
  /usr/local/bin/docker-compose -f docker-compose.aws.yml --env-file .env build "$svc"
done

/usr/local/bin/docker-compose -f docker-compose.aws.yml --env-file .env up -d
