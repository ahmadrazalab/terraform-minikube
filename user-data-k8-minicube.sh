#!/bin/bash
sudo apt update -y
sudo apt install -y curl wget apt-transport-https
sudo apt install -y docker.io
sudo systemctl enable --now docker

# minicube-setup
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

# kubectl setup
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
# remove --force  if you have  2 vcpu && root user also require --force
# minikube start --force
# minikube start --driver=docker --force

# minicube dashboard setup for container
# minikube dashboard --url --port=8081 &
