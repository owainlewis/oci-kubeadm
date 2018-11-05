# Kubeadm Ansible Playbook (Oracle Cloud Infrastructure)

This project will help you create a Kubernetes cluster on Oracle Cloud Infrastructure. It uses Terraform to provision infrastructure and Ansible to configure and install Kubernetes.

In an effort to keep things simple, this project only targets CentOS and Oracle Linux.

### Prerequisites 

1. Terraform
2. Ansible
3. The Terraform provider for OCI
4. An Oracle Cloud Infrastructure account

## Scope / Todo

- [x] Provision a Kubernetes cluster using kubeadm
- [x] Install the Oracle Cloud Controller Manager
- [ ] High Availability (Multi Master)
- [ ] Upgrade
- [ ] Networking configuration options (Calico etc)

## To Do

- [ ] Install the Oracle OCI CSI Storage plugin 
- [ ] Install the Oracle OCI CNI Networking plugin

# Getting started

1. Create the OCI infrastructure for your cluster. This requires a recent install of the OCI terraform provider.

```
make infra
```

2. Update the hosts.ini file with the cluster information generated above

```
[master]
192.16.35.12

[node]
192.16.35.[10:11:12]

[kube-cluster:children]
master
node
```

### Run the Ansible playbook

```sh
$ make
```

### Verify

Verify cluster is fully running:

```sh
➜  oci-kubeadm git:(master) k get nodes
NAME                STATUS    ROLES     AGE       VERSION
k8s-master-ad-1-0   Ready     master    3h        v1.12.2
k8s-node-ad-1-0     Ready     <none>    3h        v1.12.2
k8s-node-ad-2-0     Ready     <none>    3h        v1.12.2
k8s-node-ad-3-0     Ready     <none>    3h        v1.12.2
```
