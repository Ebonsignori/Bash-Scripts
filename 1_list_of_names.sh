#!/usr/bin/env bash

## Prompt and read in array of names separated by spaces
echo "Enter a list of names separated by characters."
read -a name_array

## If the user didn't enter anything, prompt until they do
declare -i input_length=${#name_array[@]}
while [[ "$input_length" -le 0 ]]
do
 echo "Please enter at least one name"
 read -a name_array
 input_length=${#name_array[@]}
done

## Initialize variables
declare -i var=0
declare -a number_post_fixes=("st" "nd" "rd" "th")
largest_name=""
declare -i largest_count=0

## Loop through each name
for name in "${name_array[@]}"
do
    ## Get current number post_fix
    if [[ "$var" -lt 4 ]]
    then
      post_fix=${number_post_fixes[${var}]}
    fi

    ## Increment and print results
    var+=1
    echo "$name is the ${var}${post_fix} name in the list with ${#name} characters"

    if [[ "${#name}" -gt ${largest_count} ]]
    then
        largest_count=${#name}
        largest_name=${name}
    fi
done

echo ""
echo "Largest name was '$largest_name' with $largest_count characters"