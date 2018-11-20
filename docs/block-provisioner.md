# OCI Block Storage Provisioning

Create the OCI storage class

```sh
cat <<'$EOF' | kubectl create -f -
kind: StorageClass
apiVersion: storage.k8s.io/v1beta1
metadata:
  name: oci
provisioner: oracle.com/oci
$EOF
```

Create PVC

```sh
cat <<'$EOF' | kubectl create -f -
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: nginx-block-volume
spec:
  storageClassName: oci
  selector:
    matchLabels:
      failure-domain.beta.kubernetes.io/zone: AD-1
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 50Gi
$EOF
```
