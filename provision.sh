#!/bin/bash
# Update and install Docker
sudo apt-get update -y
sudo apt-get install -y docker.io docker-compose

# Enable and start Docker
sudo systemctl enable docker
sudo systemctl start docker

# Clone the repo or copy files
cd /home/ubuntu
git clone https://github.com/Afsheen28/tech511-sparta-app.git
cd tech511-sparta-app

# Bring up Docker containers
sudo docker-compose up -d

# Optional: Seed the database
sudo docker exec -it node_app bash -c "node seeds/seed.js"

echo "Deployment complete! App is running on port 3000"
