#!/bin/bash

# Preparation
sudo apt-get update
sudo apt-get upgrade -y
sudo apt install -y python3-pip -y

# doctl
cd ~/ && rm -R ~/doctl
cd ~/ && mkdir doctl && cd doctl
curl -LO https://github.com/digitalocean/doctl/releases/download/v1.45.1/doctl-1.45.1-linux-amd64.tar.gz 
tar -xvf doctl-1.45.1-linux-amd64.tar.gz
sudo mv ~/doctl/doctl /usr/local/bin

# kubectl 
cd ~/ && rm -R ~/kubectl
cd ~/ && mkdir kubectl && cd kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# kubectx & kubens
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# kube-ps1
sudo git clone https://github.com/jonmosco/kube-ps1.git /opt/kube-ps1

# Helm 3
cd ~/ && rm -R ~/helm-3
cd ~/ && mkdir helm-3 && cd helm-3
wget https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz
tar -zxvf helm-v3.2.4-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin/helm
helm repo add stable https://kubernetes-charts.storage.googleapis.com/

# Octant
cd ~/ && rm -R ~/octant
cd ~/ && mkdir octant && cd octant
curl -LO https://github.com/vmware-tanzu/octant/releases/download/v0.15.0/octant_0.15.0_Linux-64bit.tar.gz
tar -xvf octant_0.15.0_Linux-64bit.tar.gz
sudo mv ./octant_0.15.0_Linux-64bit/octant /usr/local/bin/octant

# Locust
pip3 install locust
cd ~/ && rm -R ~/locust
cd ~/ && mkdir locust && cd locust
wget https://raw.githubusercontent.com/jamesbuckett/microservices-metrics-chaos/master/locustfile.py

reboot

# End of Script