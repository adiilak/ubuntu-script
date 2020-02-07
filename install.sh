#!/bin/bash

# Update ubuntu
 echo "[TASK 1] Update ubuntu"
apt-get update
apt-get upgrade -y

# Install docker from Docker-ce repository
echo "[TASK 2] Install docker from Docker-ce repository"
apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
usermod -aG docker your-user

# Enable docker service
echo "[TASK 3] Enable and start docker service"
systemctl enable docker
systemctl start docker

# Disable swap
sudo swapoff -a
sed -i '2 s/^/#/' /etc/fstab

# Add yum repo file for Kubernetes
echo "[TASK 3] Add apt repo file for kubernetes"
apt update
apt install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg
apt-key add -
touch /etc/apt/sources.list.d/kubernetes.list
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main"
tee -a /etc/apt/sources.list.d/kubernetes.list

# Install Kubernetes
echo "[TASK 4] Install Kubernetes (kubeadm, kubelet and kubectl)"
apt update
apt install -y kubeadm


