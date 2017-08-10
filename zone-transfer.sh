#!/bin/bash
# Simple Zone Transfer Bash Script
# $1 is the first argument given after the bash script
# Check if argument given, if not, print usage

if [ -z "$1" ]; then 
  echo "[*] Simple Zone Transfer Script"
  echo "[*] Useage   : $0 <domain name>"
  exit 0
fi

# If argument was given, identify the DNS servers for the domain.
# For each of these  servers attempt a zone transfer

for server in $(host -t ns $1 | cut -d" " -f4); do 
  host -l $1 $server | grep "has address"
done
