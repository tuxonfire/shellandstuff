#!/usr/bin/bash

# =^^=
# Get ip from network interface
# sh thisscript.sh eth0

echo "This is my bash script, redirecting an output into a file" > ~/output.txt
echo "" >> ~/output.txt
echo "#####################################################" >> ~/output.txt
echo "LIST BLOCK DEVICES" >> ~/output.txt
echo "" >> ~/output.txt
lsblk >> ~/output.txt
echo "" >> ~/output.txt
echo "#####################################################" >> ~/output.txt
echo "FILESYSTEM FREE SPACE STATUS" >> ~/output.txt
echo "" >> ~/output.txt
df -h >> ~/output.txt
echo "#####################################################" >> ~/output.txt
