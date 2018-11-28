#!/bin/bash

echo "Removing flexvolume driver from cluster"

kubectl -n kube-system delete ds oci-flexvolume-driver-master
kubectl -n kube-system delete ds oci-flexvolume-driver-worker

kubectl -n kube-system delete secret oci-flexvolume-driver
kubectl -n kube-system delete secret oci-flexvolume-driver-kubeconfig

echo "Done"
