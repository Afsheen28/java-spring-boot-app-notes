#!/bin/bash
apt-get update -y
apt-get install -y git docker.io docker-compose -y
systemctl enable docker
systemctl start docker

# Deploy app automatically
cd /home/ubuntu
git clone https://github.com/Afsheen28/tech511-sparta-app.git
cd tech511-sparta-app
docker-compose up -d
