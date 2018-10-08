#!/usr/bin/env bash

# Update system
yum update -y

# Disable SELinux
setenforce 0

# Remove existing Docker packages
yum remove docker \
           docker-client \
           docker-client-latest \
           docker-common \
           docker-latest \
           docker-latest-logrotate \
           docker-logrotate \
           docker-selinux \
           docker-engine-selinux \
           docker-engine

# Install Docker prerequisites 
yum install -y \
    yum-utils \
    device-mapper-persistent-data \
    lvm2

# Install Docker CE
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo    
yum install -y docker-ce

# Add current user to Docker group
usermod -aG docker $(whoami)

# Install K8s packages
bash -c 'cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF'

yum install -y kubelet kubeadm kubectl

systemctl enable kubelet && sudo systemctl start kubelet

# Manage firewall
systemctl disable firewalld && systemctl stop firewalld

# Install Kubeadm (follow post install steps)
kubeadm init --pod-network-cidr 10.244.0.0/16

# mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# sudo chown $(id -u):$(id -g) $HOME/.kube/config
