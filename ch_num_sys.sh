#!/bin/bash
while true 
do
    echo " Your input format :: 'number'  'its_base_value'  'conversion_base_value'"
    read -p "Enter here :: " user_in user_base final_base
    #This is the single line command in terminal.
    echo " ibase=$user_base; obase=$final_base; $user_in" | bc
    read -p "Do you want to continue? <y/N> " b
    if [[ $b == "y" || $b == "Y" || $b == "yes" || $b == "Yes" || $b == "YES"  ]]
    then
        continue
    else 
        exit 
    fi
done
