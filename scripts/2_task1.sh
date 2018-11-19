#!/usr/bin/env bash

## Initialize variables
declare -i sum=0
declare -i product=1

## Set integer_array as each of the parameters passed to script
integer_array=( "$@" )

## Find the integers sum and product
for number in "${integer_array[@]}"
do
    product=$((number*${product}))
    sum+=number
done
echo "Sum of args: ${sum}"
echo "Product of args: ${product}"

## Compare the product and sum
if [[ "$product" -eq sum ]]
then
    echo "The product and sum are the same size."
elif [[ "$product" -gt sum ]]
then
    echo "The product is larger."
else
    echo "The sum is larger."
fi