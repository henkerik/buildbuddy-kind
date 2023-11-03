#!/usr/bin/env bash

set -e

cat /proc/cpuinfo

echo "whoami"
whoami

podman info

minikube config set rootless true
minikube start --driver=podman --container-runtime=containerd
minikube status 

kubectl cluster-info
kubectl get nodes