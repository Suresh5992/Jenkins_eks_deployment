#!/bin/bash
# Install Docker
sudo yum install -y docker
sudo systemctl start docker
sudo systemctl enable docker

# Install kubelet, kubeadm, and kubectl
sudo yum install -y kubelet kubeadm kubectl
sudo systemctl start kubelet
sudo systemctl enable kubelet
sudo systemctl enable docker

# Join the worker node to the master node
kubeadm join <master-ip>:6443 --token <your-token> --discovery-token-ca-cert-hash sha256:<hash>
