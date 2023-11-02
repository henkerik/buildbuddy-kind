#!/usr/bin/env bash

set -e

KIND=$1

$KIND --version
$KIND create cluster --verbosity 4 || true
$KIND get nodes

echo "Printing logs..."
docker ps -a --format '{{json .ID}}' | xargs -I %s -- docker logs %s