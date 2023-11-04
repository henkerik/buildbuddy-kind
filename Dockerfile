FROM ubuntu:22.04@sha256:c9cf959fd83770dfdefd8fb42cfef0761432af36a764c077aed54bbc5bb25368

RUN apt update -y
RUN apt install -y curl wget apt-transport-https
RUN curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 
RUN install minikube-linux-amd64 /usr/local/bin/minikube 

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x kubectl 
RUN mv kubectl /usr/local/bin/

RUN apt install -y podman 
RUN apt install -y sudo

RUN groupadd docker
RUN useradd -g docker docker

USER docker