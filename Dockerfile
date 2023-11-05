FROM gcr.io/flame-public/rbe-ubuntu20-04@sha256:036ae8c90876fa22da9ace6f8218e614f4cd500a154fc162973fff691e72d28e

# FROM ubuntu:22.04@sha256:c9cf959fd83770dfdefd8fb42cfef0761432af36a764c077aed54bbc5bb25368
# 
# RUN apt update -y
# RUN apt install -y curl wget apt-transport-https
# RUN curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 
# RUN install minikube-linux-amd64 /usr/local/bin/minikube 
# 
# RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
# RUN chmod +x kubectl 
# RUN mv kubectl /usr/local/bin/
# 
# RUN apt install -y podman 
# RUN apt install -y sudo

RUN curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
RUN chmod +x kubectl 
RUN mv kubectl /usr/local/bin/

RUN apt update -y
RUN apt -y install fuse3

# Docker
#
# Note: gnupg is only needed to install Docker, so we uninstall it at the end of
# this step and also run `apt-get autoremove` to get rid of the unnecessary
# packages it came with.
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#       ca-certificates \
#       curl \
#       gnupg \
#       lsb-release \
#       && \
#     mkdir -p /etc/apt/keyrings && \
#     curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
#     echo >/etc/apt/sources.list.d/docker.list "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
#     apt-get update && \
#     apt-get install -y \
#       docker-ce \
#       docker-ce-cli \
#       containerd.io \
#       && \
#     apt-get remove -y gnupg && \
#     apt-get autoremove -y && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*