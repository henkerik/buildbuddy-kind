#!/usr/bin/env bash

set -e

KIND=$1

$KIND --version
$KIND create cluster --verbosity 4
$KIND get nodes