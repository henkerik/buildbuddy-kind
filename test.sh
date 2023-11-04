#!/usr/bin/env bash

set -e

cat /proc/cpuinfo

echo "whoami"
whoami

echo "groups"
groups

ech "su docker"
su docker
whoami

podman info

minikube config set rootless false
minikube start --driver=podman --container-runtime=cri-o
minikube status 

kubectl cluster-info
kubectl get nodes