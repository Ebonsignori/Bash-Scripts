#!/usr/bin/env bash

## Get directory and file names from command parameters
directory_name=$1
file_name=$2

## If directory already exists, delete it
if [[ -d "$directory_name" ]]
then
  echo "Directory already exists!"
  echo "Deleting existing directory..."
  rm -rf ${directory_name}
fi

## Create new relative directory with file
echo "Creating new directory: ${directory_name} with file: ${file_name}"
mkdir ${directory_name}
touch ${directory_name}/${file_name}