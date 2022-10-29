#!/bin/bash
# author: eleAche
# version: 0.0 (esto solo es un script)
if [ $(id -u) -ne 0 ]; then
	echo "This script must be ran as root"
	exit 1
fi
ip link  | grep -v lo | grep -v link | awk -F: '{print $2}' | while read line; do
  ifconfig $line down
  macchanger -r $line
  ifconfig $line up
done
anonsurf start || anonsurf restart || echo "please, run mask-installer.sh"