# File Storage

### Install

Ensure you have the OCI FSS volume provisioner installed. Run the following to install on your cluster:

```
hack/inventory.sh
make provisioner
```

### Create mount target

We first need to create a mount target

oci fs mount-target create --availability-domain=UpwH:UK-LONDON-1-AD-1 \
--compartment-id=$(terraform output compartment_id) \
--subnet-id=$(terraform output subnet_ad_1_id)

### Create storage class 

Create a new StorageClass that references your mount target

```sh
cat <<'$EOF' | kubectl create -f -
kind: StorageClass
apiVersion: storage.k8s.io/v1beta1
metadata:
  name: oci-fss
provisioner: oracle.com/oci-fss
parameters:
  mntTargetId: ocid1.mounttarget.oc1.uk_london_1.aaaaaa4np2snssoinruhellqojxwiotvnmwwy33omrxw4ljrfvqwiljr
$EOF
```

### Create PVC

```sh
cat <<'$EOF' | kubectl create -f -
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: nginx-fss-volume
spec:
  storageClassName: oci-fss
  selector:
    matchLabels:
      failure-domain.beta.kubernetes.io/zone: AD-1
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 100Gi
$EOF
```


### Use the PVC

You can now create a Pod that uses FSS to persist data

```sh
cat <<'$EOF' | kubectl create -f -
---
kind: Pod
apiVersion: v1
metadata:
  name: nginx
spec:
  volumes:
    - name: nginx
      persistentVolumeClaim:
        claimName: nginx-fss-volume
  containers:
    - name: nginx
      image: nginx
      ports:
        - containerPort: 80
      volumeMounts:
      - mountPath: "/usr/share/nginx/html"
        name: nginx
$EOF
```
