#!/usr/bin/env bash

set -e

# cat /proc/cpuinfo
# 
# echo "whoami"
# whoami
# 
# echo "groups"
# groups
# 
# echo "su docker"
# su docker
# whoami
# 
# echo "add docker group"
# groupadd docker
# useradd -g docker docker
# su docker
# 
# podman info
# 
# minikube config set rootless false
# minikube start --driver=podman --container-runtime=cri-o
# minikube status 

k3d cluster create mycluster --kubeconfig-switch-context

k3d kubeconfig merge mycluster --kubeconfig-switch-context

echo "kubectl cluster-info"
kubectl cluster-info

echo "kubectl cluster-info dump"
kubectl cluster-info dump

echo "kubectl get nodes"
kubectl get nodes