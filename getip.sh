#!/bin/bash -x

# =^^=
# Get eth0 ip
# sh thisscript.sh eth0

interface=$1
echo "Interface: $interface"
ip=$(ifconfig $interface | grep inet)
# echo $ip | cut -d " " -f 2
ip=$( echo $ip | cut -d " " -f 2)
ip=$(echo $ip | cut -d ":" -f 2)
echo "######getting ip address from $interface interface#########"
echo " ** Interface: $interface  ***"
echo " ** IP Address: $ip ****"
exit 0
