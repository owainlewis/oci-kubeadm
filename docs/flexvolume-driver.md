# Flexvolume Driver

Create configuration secrets

```sh
kubectl create secret generic oci-flexvolume-driver-kubeconfig \
    -n kube-system \
    --from-file=kubeconfig=ansible/admin.conf
```

```sh
kubectl create secret generic oci-flexvolume-driver \
    -n kube-system \
    --from-file=config.yaml=manifests/flexvolume-config.yaml
```

Install the flexvolume driver manifests
