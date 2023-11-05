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

# docker info

# echo "systemctl list-unit-files"
# systemctl list-unit-files
# 
# echo "systemctl status docker"
# Fails with System has not been booted with systemd as init system (PID 1). Can't operate.
# systemctl status docker

# echo "stat -fc %T /sys/fs/cgroup/"
# stat -fc %T /sys/fs/cgroup/
# 
# echo "ls -la /usr/sbin"
# ls -la /usr/sbin
# 
# echo "echo \$PATH"
# echo $PATH

# echo "k3s check-config"
# k3s check-config

# PATH=$PATH\:/usr/sbin; export PATH

# k3d cluster delete mycluster
# k3d cluster create mycluster --trace --kubeconfig-switch-context --k3s-arg='--snapshotter=native@all:*'

# k3d kubeconfig merge mycluster --kubeconfig-switch-context


k0s sysinfo

docker run -d --name k0s --hostname k0s --privileged -v /var/lib/k0s -p 6443:6443 docker.io/k0sproject/k0s:latest

echo "docker ps -a"
docker ps -a

sleep 60

echo "docker ps -q | xargs -L 1 docker logs"
docker ps -q | xargs -L 1 docker logs

echo "kubectl cluster-info"
docker exec k0s kubectl cluster-info

echo "kubectl cluster-info dump"
docker exec k0s kubectl cluster-info dump

echo "kubectl config get-contexts"
docker exec k0s kubectl config get-contexts

echo "kubectl get nodes"
docker exec k0s kubectl get nodes

echo "kubectl get pods -A"
docker exec k0s kubectl get pods -A

echo "kubectl get namespaces"
docker exec k0s kubectl get namespaces

echo "kubectl -n=kube-system get pods"
docker exec k0s kubectl -n=kube-system get pods

# echo "docker ps -a"
# docker ps -a


docker exec k0s cat /var/lib/k0s/pki/admin.conf > ~/.kube/config

echo "cat ~/.kube/config"
cat ~/.kube/config

echo "kubectl apply"
cat <<EOF | docker exec k0s kubectl apply -f -
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

echo "docker exec k0s kubectl pods -A"
kubectl --kubeconfig /etc/rancher/k3s/k3s.yaml get pods -A

echo "docker ps -a"
docker ps -a