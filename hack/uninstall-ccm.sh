#!/bin/bash

echo "Removing CCM from cluster"

kubectl -n kube-system delete ds oci-cloud-controller-manager
kubectl -n kube-system delete secret oci-cloud-controller-manager

echo "Done"
