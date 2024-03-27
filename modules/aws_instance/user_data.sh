#!/bin/bash

# Update system.
yum update -y

# Install and start Docker.
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user

# Install Docker Compose.
DOCKER_COMPOSE_URL="https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)"
curl -L "$DOCKER_COMPOSE_URL" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install AWS CLI v2.
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install -i /usr/local/aws-cli -b /usr/local/bin