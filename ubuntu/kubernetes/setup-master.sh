#!/bin/bash
#IP address
masterIP=`ifconfig eth0 | grep "inet addr" | cut -d ':' -f 2 | cut -d ' ' -f 1`
#kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=172.26.4.96 --kubernetes-version stable-1.10
set -x
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address="${masterIP}" --kubernetes-version $1