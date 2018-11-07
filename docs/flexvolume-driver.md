# Flexvolume Driver

Create configuration secrets.

## 1.) Kubeconfig secret

The first secret is a kubeconfig file that the driver will use to lookup node information based on nodename. The kubeconfig will need permission to get node information.

```sh
kubectl create secret generic oci-flexvolume-driver-kubeconfig \
    -n kube-system \
    --from-file=kubeconfig=ansible/admin.conf
```

## 2.) Configuration secret

The second secret we need is a configuration file with user authentication details. 

```sh
kubectl create secret generic oci-flexvolume-driver \
    -n kube-system \
    --from-file=config.yaml=manifests/flexvolume-config.yaml
```

An example configuration should look something like this:

```yaml
---
auth:
  region: us-phoenix-1
  tenancy: ocid1.tenancy.oc1..
  compartment: ocid1.compartment.oc1..
  user: ocid1.user.oc1..
  key: |
    -----BEGIN RSA PRIVATE KEY-----
    -----END RSA PRIVATE KEY-----
  fingerprint: a4:bb:34:43:54:c5:af:a5:4b:23:ce:82:2d:7f:12:45
```

## 3.) Apply manifests

Install the flexvolume driver manifests

```
```
