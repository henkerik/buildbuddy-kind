#!/usr/bin/env bash

set -e

docker info
docker context inspect

minikube start --driver=docker
minikube status 

kubectl cluster-info
kubectl get nodes

echo "docker ps --all"
docker ps --all

echo "Printing logs..."
docker ps -a --format '{{json .ID}}' | xargs -I %s -- docker logs %s