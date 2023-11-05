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

docker info

echo "ls -la /usr/sbin"
ls -la /usr/sbin

echo "echo \$PATH"
echo $PATH

echo "k3s check-config"
k3s check-config

k3d cluster delete mycluster
k3d cluster create mycluster --trace --kubeconfig-switch-context --k3s-arg='--snapshotter=fuse-overlayfs@all:*'

k3d kubeconfig merge mycluster --kubeconfig-switch-context

echo "kubectl cluster-info"
kubectl cluster-info

echo "kubectl cluster-info dump"
kubectl cluster-info dump

echo "kubectl config get-contexts"
kubectl config get-contexts

echo "kubectl get nodes"
kubectl get nodes

echo "kubectl get pods -A"
kubectl get pods -A

echo "kubectl get namespaces"
kubectl get namespaces

echo "kubectl -n=kube-system get pods"
kubectl -n=kube-system get pods

echo "docker ps -a"
docker ps -a

echo "kubectl apply"
cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: helloworld
spec:
  selector:
    matchLabels:
      app: helloworld
  replicas: 1 
  template:
    metadata:
      labels:
        app: helloworld
    spec:
      containers:
      - name: helloworld
        image: karthequian/helloworld:latest
        ports:
        - containerPort: 80
EOF

sleep 10

echo "docker ps -q | xargs -L 1 docker logs"
docker ps -q | xargs -L 1 docker logs

echo "kubectl get pods -A"
kubectl get pods -A

echo "docker ps -a"
docker ps -a