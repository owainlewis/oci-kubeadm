# Kubeadm Ansible Playbook (Oracle Cloud Infrastructure)

This project will help you create a Kubernetes cluster on Oracle Cloud Infrastructure. It uses Terraform to provision infrastructure and Ansible to configure and install Kubernetes.

In an effort to keep things simple, this project only targets CentOS and Oracle Linux as well as ignoring kubeadm upgrades (for now!).

### Prerequisites

1. Terraform
2. Ansible
3. The Terraform provider for OCI
4. An Oracle Cloud Infrastructure account

# Getting started

1. Create the OCI infrastructure for your cluster. This requires a recent install of the OCI terraform provider.

```sh
# Update main.tf with your personal settings
cp main.tf.example main.tf
# Run Terraform
terraform apply
```

If you want to use instance principal authentication, make sure you have a dynamic group setup with permissions that targets the instances in your cluster.

Create a dynamic group for your instances:

```
All {instance.compartment.id = 'ocid1.compartment.oc1..'}
```

Create a policy that grants the instances appropriate permissions:

```
Allow group id DYNAMIC_GROUP_OCID to manage all-resources in compartment id COMPARTMENT_OCID
```

2. Run hack/inventory.sh to auto generate an Ansible inventory file and CCM configuration file.

```sh
➜  oci-kubeadm git:(master) ✗ ./hack/inventory.sh
Writing hosts.ini file to ansible/hosts.ini
Writing cloud-provider-config file to ansible/roles/addons/ccm/templates/cloud-provider-config.yaml.j2
```

3. Run Ansible to create a new kubeadm K8s cluster

```sh
make ansible
```

Verify the cluster has been created successfully

```sh
➜  oci-kubeadm git:(master) k get nodes
NAME                STATUS    ROLES     AGE       VERSION
k8s-master-ad-1-0   Ready     master    3h        v1.12.2
k8s-node-ad-1-0     Ready     <none>    3h        v1.12.2
k8s-node-ad-2-0     Ready     <none>    3h        v1.12.2
k8s-node-ad-3-0     Ready     <none>    3h        v1.12.2
```

4. Install the Cloud Controller Manager (CCM)

```sh
➜  oci-kubeadm git:(master) ✗ make ccm
```

Check that the CCM has succesfully installed. If everything is working your nodes should be labelled correctly with OCI information.

```sh
➜  oci-kubeadm git:(master) ✗ k get node k8s-node-ad-1-0  -o go-template='{{range $k, $v := .metadata.labels}}{{$k}}={{$v}}{{"\n"}}{{end}}'
beta.kubernetes.io/arch=amd64
beta.kubernetes.io/instance-type=VM.Standard1.1
beta.kubernetes.io/os=linux
failure-domain.beta.kubernetes.io/region=eu-frankfurt-1
failure-domain.beta.kubernetes.io/zone=EU-FRANKFURT-1-AD-1
kubernetes.io/hostname=k8s-node-ad-1-0
```

5. Install the block storage and file storage (NFS) provisioner

```
make provisioner
```

6. Install the OCI Flexdriver (temporary while we await CSI).

```
kubectl create secret generic oci-flexvolume-driver-kubeconfig -n kube-system --from-file=kubeconfig=ansible/admin.conf
kubectl create secret generic oci-flexvolume-driver -n kube-system --from-file=config.yaml=../flexvolume-config.yaml
```
