#!/usr/bin/env bash

echo "Cloud! Test 4"

echo "egrep -c '(vmx|svm)' /proc/cpuinfo"
egrep -c '(vmx|svm)' /proc/cpuinfo

echo "kvm-ok"
kvm-ok

hostname