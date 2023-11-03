#!/usr/bin/env bash

set -e

cat /proc/cpuinfo

echo "whoami"
whoami

podman info

minikube start --driver=podman
minikube status 

kubectl cluster-info
kubectl get nodes