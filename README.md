# Kubeadm Ansible Playbook (Oracle Cloud Infrastructure)

This Ansible playbook will install a Kubernetes cluster on Oracle Cloud Infrastructure using kubeadm.

It does not create the underlying OCI infrastructure required to run your Kubernetes cluster.

**This playbook targets OEL / CentOS only**

## Scope

1. Provision a Kubernetes cluster using kubeadm (DONE)
2. Install the Oracle Cloud Controller Manager
3. Install the Oracle OCI CSI Storage plugin (TODO)
4. Install the Oracle OCI CNI Networking plugin (TODO)

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
➜  oci-kubeadm git:(master) KUBECONFIG=ansible/admin.conf kubectl get nodes
NAME                STATUS    ROLES     AGE       VERSION
k8s-master-ad-1-0   Ready     master    1m        v1.12.2
k8s-node-ad-1-0     Ready     <none>    1m        v1.12.2
```
