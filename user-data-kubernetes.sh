#!/bin/bash
set -e

# --- Update System ---
sudo apt update -y && sudo apt upgrade -y

# --- Install Dependencies ---
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common conntrack

# --- Install Docker ---
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker

# --- Install Minikube ---
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube /usr/local/bin/minikube

# --- Install Kubectl ---
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install kubectl /usr/local/bin/kubectl

# --- Create Working Directory ---
mkdir -p /home/ubuntu/k8s-deploy
cd /home/ubuntu/k8s-deploy

# --- Start Minikube ---
sudo minikube start --driver=docker --force

# --- Apply YAML Files ---
sudo kubectl apply -f mongo-pv-pvc.yml
sudo kubectl apply -f mongo-deployment.yml
sudo kubectl apply -f nodejs-deployment.yml

# --- Wait for Pods ---
sudo kubectl wait --for=condition=Ready pods --all --timeout=300s

# --- Display Deployment Info ---
sudo kubectl get pods -o wide
sudo kubectl get svc -o wide