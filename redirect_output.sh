#!/bin/bash -x

# =^^=
# Get ip from network interface
# sh thisscript.sh sos...directory/

echo "----------------------------------------------------------------"
dir=$1
echo "directory: $dir"
echo ""
echo ""
echo ""
echo "######getting information address from $dir directory#########"
echo " ** Directory: $dir  ***"
echo ""
echo ""
echo "##### Contents of $dir : ###################"
ls -ltr $dir 
echo "############################################"
echo ""
grep -rnw $dir -e 'error' -e 'fail' -e 'OOM'  >> output.txt
echo "----------------------------------------------------------------"
exit 0
