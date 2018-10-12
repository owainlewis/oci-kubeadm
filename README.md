# Kubeadm Ansible Playbook (Oracle Cloud Infrastructure)

This Ansible playbook will install a Kubernetes cluster on Oracle Cloud Infrastructure using kubeadm.

It does not create the underlying OCI infrastructure required to run your Kubernetes cluster.

**This playbook targets OEL / CentOS only**

## Scope

1. Provision a Kubernetes cluster using kubeadm (DONE)
  - Use kubeadm config (TODO)
2. Install the Oracle Cloud Controller Manager
3. Install the Oracle OCI CSI Storage plugin (TODO)
4. Install the Oracle OCI CNI Networking plugin (TODO)

# Usage

1. Create 3 (or more) OCI OEL compute instances. Ensure that the VCN subnet security list rules are permissive enough (TODO)
2. Update the hosts.ini file with the IP addresses of your cluster nodes.

```
[master]
192.16.35.12

[node]
192.16.35.[10:11]

[kube-cluster:children]
master
node
```

### Run the plabook

```sh
$ make
```

### Download `admin.conf` from the master node

```sh
$ scp opc@$(PUBLIC_IP):/etc/kubernetes/admin.conf .
```

Verify cluster is fully running using kubectl:

```sh
$ export KUBECONFIG=admin.conf
$ kubectl get nodes
NAME               STATUS    ROLES     AGE       VERSION
kubeadm-master     Ready     master    11m       v1.11.3
kubeadm-worker-1   Ready     <none>    10m       v1.11.3
kubeadm-worker-2   Ready     <none>    10m       v1.11.3
```
