# Kubeadm Ansible Playbook (Oracle Cloud Infrastructure)

This Ansible playbook will install a Kubernetes cluster on Oracle Cloud Infrastructure.

## Scope

1. Provision a Kubernetes cluster using kubeadm (DONE)
2. Install the Oracle Cloud Controller Manager
3. Install the Oracle OCI CSI Storage plugin (TODO)
4. Install the Oracle OCI CNI Networking plugin (TODO)

# Usage

Add the system information gathered above into a file called `hosts.ini`. For example:
```
[master]
192.16.35.12

[node]
192.16.35.[10:11]

[kube-cluster:children]
master
node
```

### Choose your CNI / Networking solution

```yaml
# Network implementation('flannel', 'calico')
network: flannel
```

### Run the plabook

```sh
$ ansible-playbook site.yaml
...
==> master1: TASK [addon : Create Kubernetes dashboard deployment] **************************
==> master1: changed: [192.16.35.12 -> 192.16.35.12]
==> master1:
==> master1: PLAY RECAP *********************************************************************
==> master1: 192.16.35.10               : ok=18   changed=14   unreachable=0    failed=0
==> master1: 192.16.35.11               : ok=18   changed=14   unreachable=0    failed=0
==> master1: 192.16.35.12               : ok=34   changed=29   unreachable=0    failed=0
```

Download the `admin.conf` from the master node:

```sh
$ scp opc@k8s-master-ip:/etc/kubernetes/admin.conf .
```

Verify cluster is fully running using kubectl:

```sh
$ export KUBECONFIG=~/admin.conf
$ kubectl get nodes
NAME               STATUS    ROLES     AGE       VERSION                                                              kubeadm-master     Ready     master    11m       v1.11.3
kubeadm-worker-1   Ready     <none>    10m       v1.11.3
kubeadm-worker-2   Ready     <none>    10m       v1.11.3
```

# Resetting the environment

Finally, reset all kubeadm installed state using `reset-site.yaml` playbook:

```sh
$ ansible-playbook reset-site.yaml
```
