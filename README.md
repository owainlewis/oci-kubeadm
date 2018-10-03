# Kubeadm Ansible Playbook (Oracle Cloud Infrastructure)

This Ansible playbook will install a Kubernetes cluster on Oracle Cloud Infrastructure using kubeadm.

It does not create the underlying OCI infrastructure required to run your Kubernetes cluster.

## Scope

1. Provision a Kubernetes cluster using kubeadm (DONE)
2. Install the Oracle Cloud Controller Manager
3. Install the Oracle OCI CSI Storage plugin (TODO)
4. Install the Oracle OCI CNI Networking plugin (TODO)

# Usage

1. Create 3 (or more) OCI compute instances. Ensure that the VCN subnet security list rules are permissive enough (TODO)
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

3. You will also want to update values in the group_vars section to select the correct K8s version and join token

To generate a random token

```sh
LC_CTYPE=C tr -dc a-z0-9 < /dev/random | fold -w ${1:-16} | head -n 1
```

This playbook assumes you are using OEL but you can modify the ssh user in group_vars if needed (SSH user defaults to opc).

### Choose your CNI / Networking solution

```yaml
# Network implementation('flannel', 'calico')
network: flannel
```

### Run the plabook

```sh
$ ansible-playbook site.yaml
```

### Download `admin.conf` from the master node

```sh
$ scp opc@k8s-master-ip:/etc/kubernetes/admin.conf .
```

Verify cluster is fully running using kubectl:

```sh
$ export KUBECONFIG=~/admin.conf
$ kubectl get nodes
NAME               STATUS    ROLES     AGE       VERSION
kubeadm-master     Ready     master    11m       v1.11.3
kubeadm-worker-1   Ready     <none>    10m       v1.11.3
kubeadm-worker-2   Ready     <none>    10m       v1.11.3
```

# Resetting the environment

Finally, reset all kubeadm installed state using `reset-site.yaml` playbook:

```sh
$ ansible-playbook reset-site.yaml
```
