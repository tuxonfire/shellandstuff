#!/bin/bash

echo "How old are you?"
read age

if [ $age -lt 18 ]
then
    echo "ticket cost \$30"
else 
    echo "ticket cost \$100"
fi
   
