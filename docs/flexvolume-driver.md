# Flexvolume Driver

Create configuration secrets

```
kubectl create secret generic oci-flexvolume-driver-kubeconfig \
    -n kube-system \
    --from-file=kubeconfig=ansible/admin.conf
secret "oci-flexvolume-driver-kubeconfig" created
```

```yaml
kubectl create secret generic oci-flexvolume-driver \
    -n kube-system \
    --from-file=config.yaml=manifests/flexvolume-config.yaml
secret "oci-flexvolume-driver" created
```

Install the flexvolume driver manifests
