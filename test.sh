#!/usr/bin/env bash

set -e

docker info

KIND=$1

$KIND --version
$KIND create cluster --verbosity 4 || true
$KIND get nodes

echo "docker ps --all"
docker ps --all

echo "Printing logs..."
docker ps -a --format '{{json .ID}}' | xargs -I %s -- docker logs %s