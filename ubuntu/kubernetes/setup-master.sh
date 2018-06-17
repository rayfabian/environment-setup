#!/bin/bash
#get IP address
masterIP=`ifconfig eth0 | grep "inet addr" | cut -d ':' -f 2 | cut -d ' ' -f 1`
echo "Master IP address : $masterIP"
versionMajor=`kubectl version --client | awk '{print $3}' | cut -d ':' -f 2`
versionMinor=`kubectl version --client | awk '{print $4}' | cut -d ':' -f 2`
version="$versionMajor.$versionMinor"