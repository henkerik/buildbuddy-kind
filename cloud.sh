#!/usr/bin/env bash

echo "Cloud! Test 4"

echo "egrep -c '(vmx|svm)' /proc/cpuinfo"
egrep -c '(vmx|svm)' /proc/cpuinfo

echo "kvm-ok"
/usr/sbin/kvm-ok

hostname

echo "echo \$VAR_A"
echo $VAR_A