#!/usr/bin/env bash

echo "Provisioning K8s master"

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

cat > config.yaml <<EOL
kind: MasterConfiguration
apiVersion: kubeadm.k8s.io/v1alpha1
cloudProvider: external
EOL

# Install Kubeadm (follow post install steps)
kubeadm init --config config.yaml --pod-network-cidr 10.244.0.0/16

# mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# sudo chown $(id -u):$(id -g) $HOME/.kube/config
