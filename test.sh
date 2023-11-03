#!/usr/bin/env bash

set -e

cat /proc/cpuinfo

echo "whoami"
whoami

su docker
whoami

docker info
docker context inspect

minikube start --force --driver=docker
minikube status 

kubectl cluster-info
kubectl get nodes

echo "docker ps --all"
docker ps --all

echo "Printing logs..."
docker ps -a --format '{{json .ID}}' | xargs -I %s -- docker logs %s