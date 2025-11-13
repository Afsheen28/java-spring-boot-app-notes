#!/bin/bash
# === APP SERVER SETUP ===

# Update & install required packages
sudo apt update -y
sudo apt install -y openjdk-17-jdk maven git

# Clone your app repo
cd /home/ubuntu
git clone https://github.com/Afsheen28/library-java17-mysql-app.git
cd library-java17-mysql-app/LibraryProject2

# Set environment variables for Spring Boot
export SPRING_DATASOURCE_URL=jdbc:mysql://172.31.25.143:3306/library
export SPRING_DATASOURCE_USERNAME=root
export SPRING_DATASOURCE_PASSWORD=Burntwood1!

# Build the project (skip tests)
mvn clean package -DskipTests

# Run the Spring Boot app in background
nohup mvn spring-boot:run &